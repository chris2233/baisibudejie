//
//  ZJLoginRegister.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/15.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJLoginRegister.h"

@interface ZJLoginRegister ()
@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
- (IBAction)dismissButton;

@end

@implementation ZJLoginRegister

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  @return - UIStatusBarStyle 状态栏的样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (IBAction)dismissButton {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
