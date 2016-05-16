//
//  ZJTopic.h
//  百思不得姐
//
//  Created by 张杰 on 16/5/13.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJTopic : NSObject
/**名称*/
@property (nonatomic, copy) NSString *name;
/**头像*/
@property (nonatomic, copy) NSString *profile_image;
/**发帖时间*/
@property (nonatomic, copy) NSString *create_time;
/**文字内容*/
@property (nonatomic, copy) NSString *text;
/**顶的数量*/
@property (nonatomic, assign) NSInteger ding;
/**踩的数量*/
@property (nonatomic, assign) NSInteger cai;
/**转发数量*/
@property (nonatomic, assign) NSInteger repost;
/**评论的数量*/
@property (nonatomic, assign) NSInteger comment;
/**新浪加v*/
@property (nonatomic, assign, getter=isSina_v) BOOL sina_v;





@end
