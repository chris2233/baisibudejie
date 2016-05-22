//
//  ZJShowPictureViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/21.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJShowPictureViewController.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>

@interface ZJShowPictureViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UIImageView *imageView;

@end

@implementation ZJShowPictureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat pictureW = screenW;
    CGFloat pictureH = pictureW * self.topic.height / self.topic.width;
   
    
    if (pictureH > screenH) { //如果图片大于屏幕的高度
        
        imageView.frame = CGRectMake(0, 0, pictureW, pictureH);
        self.scrollView.contentSize = CGSizeMake(0, pictureH);
        
    } else {//如果图片的高度不高于屏幕的高度
        imageView.size = CGSizeMake(pictureW, pictureH);
        imageView.centerY = screenH * 0.5;
    }
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.large_image]];
    
    //给图片添加收拾
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
    [imageView addGestureRecognizer:tap];
    
}

- (IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//把图片写到图片中
- (IBAction)savePicture:(UIButton *)sender
{
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        NSLog(@"%@",error);
    } else {
        [SVProgressHUD showWithStatus:@"保存成功"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
