//
//  ZJVoiceTableViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/12.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJVoiceTableViewController.h"

@interface ZJVoiceTableViewController ()

@end

@implementation ZJVoiceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)setupTableView
{
    //设置tableview的contentinset
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat Top = titleViewsHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(Top, 0, bottom, 0);
    
    //设置侧面指示条的位置
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.backgroundColor = [UIColor blueColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-----%zd",[self class],indexPath.row];
    
    return cell;
}
@end
