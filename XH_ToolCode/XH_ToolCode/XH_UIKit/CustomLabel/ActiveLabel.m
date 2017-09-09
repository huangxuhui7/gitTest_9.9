//
//  ActiveLabel.m
//  XH_ToolCode
//
//  Created by MyMac on 2017/8/22.
//  Copyright © 2017年 MyMac. All rights reserved.
//

#import "ActiveLabel.h"

@implementation ActiveLabel

-(instancetype)initWithActiveType:(ActiveType)type{
    if ( self = [super init] ) {
        
        _type = type;
    }
    
    return self;
}


-(void)setText:(NSString *)text{
    
    [super setText:text];
    
    if ( _type == WidthActiveType ) {
        
        CGSize size = [text boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
        
        CGFloat width = size.width;
        
        if ( _maxWidth ) {
            width = _maxWidth > width ? width : _maxWidth;
        }
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, size.height);
    }
    
    
    if ( _type == HeightActiveType ) {
        
        self.numberOfLines = 0;
        
        CGSize size = [text boundingRectWithSize:CGSizeMake(self.frame.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
        
        CGFloat height = size.height;
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    }
}


-(void)setAttributedText:(NSAttributedString *)attributedText{
    
    [super setAttributedText:attributedText];
    if ( !_maxFont ) {
        _maxFont = self.font;
        
    }
    NSString * text = attributedText.string;
    CGFloat width = 0;
    CGSize size;
    for (int i = 0; i < text.length; i++) {
        NSString * str = [text substringWithRange:NSMakeRange(i, 1)];
        size = [str boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_maxFont} context:nil].size;
        width += size.width;
    }
    if ( _maxWidth ) {
        width = _maxWidth < width ? width : _maxWidth;
    }
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, size.height);
}


@end
