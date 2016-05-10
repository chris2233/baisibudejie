//
//  ZJRecommandCategory.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 zhangjie. All rights reserved.
//  推荐关注 左边的数据模型

#import "ZJRecommandCategory.h"

@implementation ZJRecommandCategory

//懒加载
- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
