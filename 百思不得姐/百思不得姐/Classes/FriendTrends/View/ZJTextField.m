//
//  ZJTextField.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/16.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTextField.h"
#import <objc/runtime.h>

static NSString * const ZJPlaceholderKeyPath = @"_placeholderLabel.textColor";

@implementation ZJTextField

- (void)awakeFromNib
{
    self.tintColor = self.textColor;
    
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder
{
    [self setValue:self.textColor forKeyPath:ZJPlaceholderKeyPath];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [self setValue:[UIColor grayColor] forKeyPath:ZJPlaceholderKeyPath];
    return [super resignFirstResponder];
}

@end
