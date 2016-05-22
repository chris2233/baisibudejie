//
//  ZJPushGuideView.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/16.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJPushGuideView.h"

@implementation ZJPushGuideView

+ (instancetype)guideView
{
    return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

+ (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    NSString *key = @"CFBundleShortVersionString";
    
    //拿到当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    //拿到之前存贮的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    //如果当前的版本号
    if (![currentVersion isEqualToString:sanboxVersion]) {
        
        //把引导界面加入到界面上
        ZJPushGuideView *guideView = [ZJPushGuideView guideView];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        //把当前的版本号存入沙盒子
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        //立即执行存贮的功能
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (IBAction)closeButton:(UIButton *)sender
{
    [self removeFromSuperview];
}

@end
