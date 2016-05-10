//
//  ZJRecommandUser.h
//  百思不得姐
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJRecommandUser : NSObject

@property (nonatomic, strong) NSString      *header;
@property (nonatomic, assign) NSInteger     fans_count;
@property (nonatomic, strong) NSString      *screen_name;
@end

/*
 "fans_count" = 4821;
 gender = 2;
 header = "http://wimg.spriteapp.cn/profile/large/2015/09/30/560b557be210a_mini.jpg";
 introduction = "";
 "is_follow" = 0;
 "is_vip" = 0;
 "screen_name" = "\U5b59\U900a \U7b491227\U4eba";
 "tiezi_count" = 261;
 uid = 9017486;
*/