//
//  ZJTopicViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/12.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTopicViewController.h"
#import "ZJTopic.h"
#import "ZJTopicCell.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import <UIImageView+WebCache.h>

@interface ZJTopicViewController ()

//帖子数据
@property (nonatomic, strong) NSMutableArray *topicArray;
//当前的页码
@property (nonatomic, assign) NSInteger page;
//加载下一页数据的时候需要这个参数
@property (nonatomic, strong) NSString *maxtime;
//上一次请求的参数
@property (nonatomic, strong) NSDictionary *params;

@end

@implementation ZJTopicViewController

- (NSMutableArray *)topicArray
{
    if (!_topicArray) {
        self.topicArray = [NSMutableArray array];
    }
    return _topicArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化表格
    [self setupTableView];
    
    //添加刷新控件
    [self setupRefresh];
}


static NSString * const  ZJTopicCellId = @"topic";
- (void)setupTableView
{
    //设置tableview的contentinset
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat Top = titleViewsHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(Top, 0, bottom, 0);
    
    //设置侧面指示条的位置
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //清除背景颜色
    self.tableView.backgroundColor = [UIColor clearColor];
    
    //注册tableviewcell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZJTopicCell class]) bundle:nil] forCellReuseIdentifier:ZJTopicCellId];
    
    //处理cell里button无法响应的问题
    //[self.tableView setDelaysContentTouches:NO];
}

- (void)setupRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    
}

#pragma mark - 加载数据

- (void)loadNewTopics
{
    //参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(self.type);
    self.params = parameters;
    
    //发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params != parameters) return;
        //取出maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        //转成模型数组
        self.topicArray = [ZJTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新列表
        [self.tableView reloadData];
        
        //结束刷新
        [self.tableView.mj_header endRefreshing];
        
        //页码
        self.page = 0;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZJLogFunc;
        if (self.params != parameters) return;
        //结束刷新
        [self.tableView.mj_header endRefreshing];
        self.page--;
    }];
}

- (void)loadMoreTopics
{
    self.page++;
    //参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @"29";
    parameters[@"page"] = @(self.type);
    parameters[@"maxtime"] = self.maxtime;
    self.params = parameters;
    
    //发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (self.params != parameters) return;
        
        //取出maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        //字典转模型
        NSArray *newTopics = [ZJTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.topicArray addObjectsFromArray:newTopics];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (self.params != parameters) return;
        
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.tableView.mj_footer.hidden = (self.topicArray.count == 0);
    return self.topicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZJTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJTopicCellId];
    
    cell.topic = self.topicArray[indexPath.row];
    
    return cell;
}

#pragma mark - tableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
@end
