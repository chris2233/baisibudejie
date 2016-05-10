//
//  ZJRecommandViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJRecommandViewController.h"
#import "ZJRecommandTableViewCell.h"
#import "ZJRecommandCategory.h"
#import "ZJRecommandUserTableViewCell.h"
#import "ZJRecommandUser.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <MJRefresh.h>

#define ZJSelectedCategory self.categories[self.categoryTableView.indexPathForSelectedRow.row]

@interface ZJRecommandViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *categories;

//左边类别表格
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
//右边用户表格
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation ZJRecommandViewController

static NSString * const ZJCategoryID = @"category";
static NSString * const ZJUserID = @"user";
/**
 *  用同一个manager的好处是，是会把所有的请求放在 self.manager.operationQueue中
 *
 *
 */
-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager =[AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupRefresh];
    
    //加载左侧类别数据
    [self loadCategories];
   
    //显示指示器
    [SVProgressHUD show];
   
}
//加载左侧类别数据
-(void)loadCategories
{
    //发送请求
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //拿到字典数组
        self.categories = [ZJRecommandCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //隐藏指示器
        [SVProgressHUD dismiss];
        
        [self.categoryTableView reloadData];
        
        //默认选择左边tableview的首行
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:(UITableViewScrollPositionTop)];
        
        //让用户进入下来刷新状态
        [self.userTableView.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
        //隐藏指示器
        //[SVProgressHUD dismiss];
        //显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
}

//初始化刷新控件
-(void)setupRefresh
{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUser)];
    self.userTableView.mj_footer.hidden = YES;
}

#pragma mark - 加载数据

-(void)loadNewUsers
{
    ZJRecommandCategory * c= ZJSelectedCategory;
    
    //设置当前页码为1
    c.currentPage = 1;
    //请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = @(c.id);
    parameters[@"page"] = @(c.currentPage);
    self.params = parameters;
    //发送请求，加载右侧的数据
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *users = [ZJRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //先清除以前的所有数据
        [c.users removeAllObjects];
        [c.users addObjectsFromArray:users];
        c.total = [responseObject[@"total"] integerValue];
        
        if (self.params != parameters) return;
        
        [self.userTableView reloadData];
        
        [self.userTableView.mj_header endRefreshing];
        
        [self checFooterStatus];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != parameters) return;
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        [self.userTableView.mj_footer endRefreshing];
        
    }];
}

-(void)loadMoreUser
{
    ZJRecommandCategory *category = ZJSelectedCategory;
    //防止网络慢的时候，数据还是显示之前夜的数据
    [self.userTableView reloadData];
    //发送请求，加载右侧的数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] =@(category.id);
    parameters[@"page"] = @(++category.currentPage);
    self.params = parameters;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *users = [ZJRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [category.users addObjectsFromArray:users];
        
        if (self.params != parameters) return;
        
        [self.userTableView reloadData];
        
        [self checFooterStatus];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (self.params != parameters) return;
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        [self.userTableView.mj_footer endRefreshing];
        
    }];
}

-(void)setupTableView
{
    self.title = @"推荐关注";
    self.view.backgroundColor = ZJGlobalBg;
    self.categoryTableView.backgroundColor = [UIColor clearColor];
    
    //注册
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZJRecommandTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZJCategoryID];
    //注册
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZJRecommandUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZJUserID];
    
    //设置
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70;
    
}
/**
 *  时刻监测footer的状态
 */
-(void)checFooterStatus
{
    ZJRecommandCategory *category = ZJSelectedCategory;
    //让没有数据的时候让footer隐藏
    self.userTableView.mj_footer.hidden = (category.users.count == 0);
    
    //代表右边用户表格
    if (category.total <= category.users.count) {
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.userTableView.mj_footer endRefreshing];
    }
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) return self.categories.count;
    //监测footer的状态
    [self checFooterStatus];
    //右边用户表格
    return [ZJSelectedCategory users].count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        //左边类别表格
        ZJRecommandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJCategoryID];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else {
        //代表右边用户表格
        ZJRecommandUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJUserID];
        
        cell.user = [ZJSelectedCategory users][indexPath.row];
        
        NSInteger count = [ZJSelectedCategory users].count;
        
        self.userTableView.mj_footer.hidden = (count == 0) ;
        
        return  cell;
    }
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //结束刷新
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    
    if([ZJSelectedCategory users].count) {
        [self.userTableView reloadData];
    } else {
        //防止网络慢的时候，数据还是显示之前夜的数据
        [self.userTableView reloadData];
        //进入下拉刷新状态
        [self.userTableView.mj_header beginRefreshing];
    }
}

#pragma mark - 控制器的销毁

-(void)dealloc
{
    //停止所有的数据请求操作
    [self.manager.operationQueue cancelAllOperations];
}

@end
