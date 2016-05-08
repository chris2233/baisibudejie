//
//  ZJTabBar.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/8.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTabBar.h"

@interface ZJTabBar()
//发布按钮
@property (strong, nonatomic)  UIButton *publishButton;

@end

@implementation ZJTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:(UIControlStateNormal)];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}

//布局子控件
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    //设置发布按钮的位置
    self.publishButton.center = CGPointMake(width * 0.5,height * 0.5);
    self.publishButton.size = self.publishButton.currentBackgroundImage.size;
    //设置其他按钮的位置
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        //如果不是UITabBarButton这种类型就继续
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        //计算按钮的x值
        CGFloat buttonX = buttonW * (index > 1?index+1:index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //增加索引
        index++;
    }
    
}

@end
