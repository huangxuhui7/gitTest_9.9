//
//  ActiveLabel.h
//  XH_ToolCode
//
//  Created by MyMac on 2017/8/22.
//  Copyright © 2017年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ActiveType){
    
    WidthActiveType         = 0,
    HeightActiveType
};


/**
 注意：需要先设置frame，再赋值text
 */
@interface ActiveLabel : UILabel


/**
 类型
 */
@property (nonatomic, assign) ActiveType            type;

/**
 计算label时使用的最大字体(富文本)
 */
@property (nonatomic, strong) UIFont                * maxFont;

/**
 label自适应的最大宽度
 */
@property (nonatomic, assign) CGFloat               maxWidth;

-(instancetype)initWithActiveType:(ActiveType)type;

@end
