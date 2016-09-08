//
//  SizeUtil.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/6.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "SizeUtil.h"

@implementation SizeUtil

//获取文字的宽度
+(float)getStringWidth:(NSString *)text  Font:(UIFont *)font{
    return [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]].width;
}
//获取文字的高度，一行显示
+(float)getStringHeight:(NSString *)text  Font:(UIFont *)font{
    return [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]].height;
}
//获取文字的高度 设置内容的尺寸
+(float)getStringHeight:(NSString *)text Font:(UIFont *)font constrainedToSize:(CGSize)size{
    return  [text boundingRectWithSize:size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil].size.height;
}

////获取文字的高度  设置内容的最大宽度
//+(float)getStringHeight:(NSString *)text Font:(UIFont *)font withWidthMax:(CGFloat)widthMax{
//    return  [self getStringHeight:text Font:font constrainedToSize:CGSizeMake(widthMax, HeightScreen)];
//}

@end
