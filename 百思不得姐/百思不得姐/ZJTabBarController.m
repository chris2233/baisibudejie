//
//  ZJTabBarController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/8.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTabBarController.h"
#import "ZJEssenceViewController.h"
#import "ZJNewViewController.h"
#import "ZJFriendTrendsViewController.h"
#import "ZJMeViewController.h"

@interface ZJTabBarController ()

@end

@implementation ZJTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary *attrsDict = [NSMutableDictionary dictionary];
    attrsDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrsDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrsDict = [NSMutableDictionary dictionary];
    selectedAttrsDict[NSFontAttributeName] = attrsDict[NSFontAttributeName];
    selectedAttrsDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrsDict forState:(UIControlStateNormal)];
    [item setTitleTextAttributes:selectedAttrsDict forState:(UIControlStateSelected)];
    
    [self          setupChildVc:[[ZJEssenceViewController alloc]init]
                       andTitle:@"精华"
                   andImageName:@"tabBar_essence_icon"
           andSelectedImageName:@"tabBar_essence_click_icon"];
    
    [self          setupChildVc:[[ZJNewViewController alloc]init]
                       andTitle:@"新帖"
                   andImageName:@"tabBar_new_icon"
           andSelectedImageName:@"tabBar_new_click_icon"];
    
    [self          setupChildVc:[[ZJFriendTrendsViewController alloc]init]
                       andTitle:@"关注"
                   andImageName:@"tabBar_friendTrends_icon"
           andSelectedImageName:@"tabBar_friendTrends_click_icon"];
    
    [self           setupChildVc:[[ZJMeViewController alloc]init]
                        andTitle:@"我"
                    andImageName:@"tabBar_me_icon"
            andSelectedImageName:@"tabBar_me_click_icon"];
    
}
/**
 *  初始化自控制器
 */
-(void)setupChildVc:(UIViewController *)vc andTitle:(NSString *)title andImageName:(NSString *)image andSelectedImageName:(NSString *)selectedImage
{
    //设置文字图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image ];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.view.backgroundColor = [UIColor  colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
    //添加自控制器
    [self addChildViewController:vc];
}

@end
