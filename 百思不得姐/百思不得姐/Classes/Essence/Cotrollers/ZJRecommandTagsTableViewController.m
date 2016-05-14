//
//  ZJRecommandTagsTableViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/11.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJRecommandTagsTableViewController.h"
#import "ZJRecommandTag.h"
#import "ZJRecommandTagTableViewCell.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
@interface ZJRecommandTagsTableViewController ()

@property (nonatomic, strong) NSArray *tags;

@end

@implementation ZJRecommandTagsTableViewController

static NSString * const ZJTagID = @"tag";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self loadTags];
}

-(void)loadTags
{
    
    //发送请求
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php"  parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.tags =  [ZJRecommandTag mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZJLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"信息加载失败"];
    }];
}

-(void)setupTableView
{
    self.title = @"推荐标签";
    self.tableView.rowHeight = 70;
    self.tableView.backgroundColor = ZJGlobalBg;
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZJRecommandTagTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZJTagID];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJRecommandTagTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ZJTagID];
    cell.recommandTag = self.tags[indexPath.row];
    return cell;
    
}

@end
