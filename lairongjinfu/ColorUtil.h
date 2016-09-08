//
//  ColorUtil.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/2.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import <Foundation/Foundation.h>

//设置RGB颜色值
#define SETCOLOR(R,G,B,A)	[UIColor colorWithRed:(CGFloat)R/255 green:(CGFloat)G/255 blue:(CGFloat)B/255 alpha:A]

#define ColorWhite  [ColorUtil colorWithHexString:@"#ffffff"]
//Nav标题字体颜色
#define ColorNavTitle [ColorUtil colorWithHexString:@"#222222"]

//控制器主背景色
#define ColorBGGray [ColorUtil colorWithHexString:@"#eff0f4"]

//进度条背景色
#define ColorProgressBackground [ColorUtil colorWithHexString:@"#dcdee4"]

//白色按钮高亮时颜色
#define ColorBtnWhiteHighlight [ColorUtil colorWithHexString:@"#f8f8f8"]

//正文字体颜色
#define ColorTextContent [ColorUtil colorWithHexString:@"#333333"]

//标题字体颜色
#define ColorTextTitleImport [ColorUtil colorWithHexString:@"#222222"]

//辅助字体颜色
#define ColorTextVice [ColorUtil colorWithHexString:@"#999999"]

//分隔线颜色
#define ColorLine [ColorUtil colorWithHexString:@"#dcdee4"]

//理财选择按钮灰色背景
#define ColorCheckButtonGray [ColorUtil colorWithHexString:@"#cccccc"]

// 登录框 边框色值
#define KlayerBorder  [ColorUtil colorWithHexString:@"#d9d9d9"]

//大篇幅文字 按钮无效背景
#define ColorBigContentText [ColorUtil colorWithHexString:@"#666666"]

//来融绿色值
#define KGreenColor  [ColorUtil colorWithHexString:@"#c7eccb"]

//绿色颜色值
#define GreenColor ColorRedMain

//透明的黑色
#define ColorBlackView  SETCOLOR(0,0,0,0.3)
#define ColorBlackTop [ColorUtil colorWithHexString:@"#e1ddda"]

//粉红颜色值
#define PinkColor  [ColorUtil colorWithHexString:@"#e34f4f"]
//蓝色字体颜色值
#define BluewordColor  [ColorUtil colorWithHexString:@"#436EEE"]
//主色调红色值
#define ColorRedMain  [ColorUtil colorWithHexString:@"#fd5353"]
#define AlphaColorRedMainHeightLight  0.6
//主色调红色值高亮
#define ColorHeightRedMain  [ColorUtil colorWithHexString:@"#fd4a49"]
//江西来融蓝色值
#define KBlueColor  [ColorUtil colorWithHexString:@"#2fbdf2"]
// 黑色
#define KBlackColor  [ColorUtil colorWithHexString:@"#3a3a3a"]
// 黄色
#define InvestYellowColor  [ColorUtil colorWithHexString:@"#feba35"]
// 绿色
#define InvestGreenColor  [ColorUtil colorWithHexString:@"#7ac446"]

//----------------------RGB颜色----------------------------
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor  KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
#define kColorWithHex(rgbValue) \[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

@interface ColorUtil : NSObject

/** 颜色转换 IOS中十六进制的颜色转换为UIColor（RGB） **/
+ (UIColor *) colorWithHexString: (NSString *)color;

@end

