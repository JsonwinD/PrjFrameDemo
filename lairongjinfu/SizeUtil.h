//
//  SizeUtil.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/6.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HeightNavigationAndStateBar 64  //nav高度
#define HeightStateBar 20 //状态栏高度
#define HeightTabBar 44  //底部Tab高度
#define HeightScreen [[UIScreen mainScreen] bounds].size.height
#define WidthScreen [[UIScreen mainScreen] bounds].size.width
//间距设置
#define SpaceSmall 5
#define SpaceMediumSmall 10
#define SpaceMediumBig 15
#define SpaceBig 20

//分隔线的高度
#define HeightLine 0.8

//首页
//广告展板宽高比例
#define RateAd  2.0

//理财
#define HeightCheckButton  40

//底栏
#define HeightBottomToolBar 44

@interface SizeUtil : NSObject

+(float)getStringWidth:(NSString *)text  Font:(UIFont *)font;
+(float)getStringHeight:(NSString *)text  Font:(UIFont *)font;
+(float)getStringHeight:(NSString *)text Font:(UIFont *)font constrainedToSize:(CGSize)size;

//+(float)getStringHeight:(NSString *)text Font:(UIFont *)font withWidthMax:(CGFloat)widthMax;

//+(float)getStringHeight:(NSString *)text Font:(UIFont *)font maxWidth:(CGFloat)width;@end
@end
