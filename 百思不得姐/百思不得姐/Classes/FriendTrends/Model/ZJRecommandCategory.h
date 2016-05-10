//
//  ZJRecommandCategory.h
//  百思不得姐
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJRecommandCategory : NSObject

@property (nonatomic, assign) NSInteger         id;

@property (nonatomic, assign) NSInteger         count;

@property (nonatomic, strong) NSString          *name;

@property (nonatomic, assign) NSInteger         total;

@property (nonatomic, assign) NSInteger         currentPage;
//用于存放用户的数据
@property (nonatomic, strong) NSMutableArray    *users;

@end
