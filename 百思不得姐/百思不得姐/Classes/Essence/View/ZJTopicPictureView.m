//
//  ZJTopicPictureView.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/17.
//  Copyright © 2016年 zhangjie. All rights reserved.
//  图片帖子中间的那块内容

#import "ZJTopicPictureView.h"
#import "ZJProgressView.h"
#import "ZJShowPictureViewController.h"
#import <UIImageView+WebCache.h>

@interface ZJTopicPictureView ()
//图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//gif 标志
@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;
//查看大图的按钮
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
//进度条控件
@property (weak, nonatomic) IBOutlet ZJProgressView *progressView;



@end

@implementation ZJTopicPictureView

-(void)awakeFromNib
{
    //当图片不能正常显示的时候可以考虑用这个方法
    self.autoresizingMask = UIViewAutoresizingNone;
    
    //给图片添加点击事件
    
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPicture)];
    [self.imageView addGestureRecognizer:tap];
}

- (void)showPicture
{
    ZJShowPictureViewController *pictureView = [[ZJShowPictureViewController alloc] init];
    pictureView.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:pictureView animated:YES completion:nil];
}

+ (instancetype)pictureView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setTopic:(ZJTopic *)topic
{
    _topic = topic;
    
    /**
     *  取出图片的第一个字节，就可以判断出图片的真实类型
     */
    
    //一旦调用topic属性的get方法，就把图片的数据设置到cell上
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden = NO;
        CGFloat progress = 1.0 * receivedSize / expectedSize;
    
        [self.progressView setProgress:progress];
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
        
        //如果是大图片才需要绘图处理，否则直接return
        if (topic.isBigPicture == NO) return;
        
        //开启图形处理上下文
        UIGraphicsBeginImageContextWithOptions(topic.pictureViewFrame.size, YES, 0.0);
        
        //将下载完的image对象，绘制到图形上下文
        CGFloat width = topic.pictureViewFrame.size.width;
        CGFloat height = width * image.size.height / image.size.width;
        [image drawInRect:CGRectMake(0, 0, width, height)];
        
        //获得图片
        self.imageView.image =  UIGraphicsGetImageFromCurrentImageContext();
        
        //结束图形上下文
        UIGraphicsEndImageContext();
    }];
    
    //判断是否是gif，pathExtension字符串的方法，拿到这个字符串的扩展名
    NSString *extension = topic.large_image.pathExtension;
    //忽略大小写比较
    self.gifImageView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
    
    // 判断是否显示点击查看全图
    if (topic.isBigPicture) {
        self.seeBigButton.hidden = NO;
        
    } else {
        self.seeBigButton.hidden = YES;
        
    }
    
    
}
@end

