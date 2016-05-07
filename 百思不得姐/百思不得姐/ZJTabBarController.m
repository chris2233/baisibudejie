//
//  ZJTabBarController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/8.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTabBarController.h"

@interface ZJTabBarController ()

@end

@implementation ZJTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 往里面添加自控制器就可以了
    UIViewController *vc01 = [[UIViewController alloc]init];
    vc01.tabBarItem.title = @"精华";
    vc01.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    vc01.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    vc01.view.backgroundColor = [UIColor  redColor];
    [self addChildViewController:vc01];
    
    UIViewController *vc02 = [[UIViewController alloc]init];
    vc02.tabBarItem.title = @"新帖";
    vc02.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    vc02.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    vc02.view.backgroundColor = [UIColor  greenColor];
    [self addChildViewController:vc02];
    
    UIViewController *vc03 = [[UIViewController alloc]init];
    vc03.tabBarItem.title = @"关注";
    vc03.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    vc03.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    vc03.view.backgroundColor = [UIColor  blueColor];
    [self addChildViewController:vc03];
    
    UIViewController *vc04 = [[UIViewController alloc]init];
    vc04.tabBarItem.title = @"我";
    vc04.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    vc04.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    vc04.view.backgroundColor = [UIColor  whiteColor];
    [self addChildViewController:vc04];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
