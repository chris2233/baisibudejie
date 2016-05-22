//
//  ZJTopicCell.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/13.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTopicCell.h"
#import <UIImageView+WebCache.h>
#import "ZJTopicPictureView.h"

@interface ZJTopicCell ()
//头像
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
//昵称
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//顶按
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
//踩按
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
//分享
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
//评论
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
//新浪加v用户
@property (weak, nonatomic) IBOutlet UIImageView *sina_v;
//帖子的文字内容
@property (weak, nonatomic) IBOutlet UILabel *myTextLabel;

@property (weak, nonatomic) ZJTopicPictureView *pictureView;
@end

@implementation ZJTopicCell

-(ZJTopicPictureView *)pictureView
{
    if (!_pictureView) {
        ZJTopicPictureView *pictureView = [ZJTopicPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

-(void)awakeFromNib
{
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
}
- (IBAction)dingButtonClick:(UIButton *)sender {
    
    ZJLogFunc;
    
}

-(void)setTopic:(ZJTopic *)topic
{
    
    _topic = topic;
    
    //设置新郎加v
    self.sina_v.hidden = !topic.sina_v;
    //设置头像
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image]
                             placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    //设置昵称
    self.nameLabel.text = topic.name;
    
    //设置帖子的创建时间
    self.timeLabel.text = topic.create_time;
    
    //设置按钮的文字
    [self setupButtonTitle:self.dingButton      count:topic.ding    placeHolder:@"顶"];
    [self setupButtonTitle:self.caiButton       count:topic.cai     placeHolder:@"踩"];
    [self setupButtonTitle:self.shareButton     count:topic.repost  placeHolder:@"分享"];
    [self setupButtonTitle:self.commentButton   count:topic.comment placeHolder:@"评论"];
    
    //设置帖子的文字内容
    self.myTextLabel.text = topic.text;
    
    //根据帖子的类型添加对应的类型添加
    if (topic.type == ZJTopicViewTypePicture) {
        self.pictureView.topic = topic ;
        self.pictureView.frame = topic.pictureViewFrame;
    }
}

/**
 *  处理button的title
 *
 *  @param button 传入button
 *  @param count  button上数字
 */
- (void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeHolder:(NSString *)placeHolder
{
    if (count > 10000) {
        placeHolder = [NSString stringWithFormat:@"%.1f万",count/10000.0];
    } else if (count > 0) {
        placeHolder = [NSString stringWithFormat:@"%zd",count];
    }
    [button setTitle:placeHolder forState:(UIControlStateNormal)];
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.x = ZJTopicCellMargin;
    frame.size.width -= frame.origin.x * 2;
    frame.size.height -= ZJTopicCellMargin;
    frame.origin.y += ZJTopicCellMargin;
    [super setFrame:frame];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

@end
