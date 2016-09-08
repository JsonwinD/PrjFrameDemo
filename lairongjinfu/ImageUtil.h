//
//  ImageUtil.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/2.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtil : NSObject

+(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage *)imageWithColor:(UIColor *)color withAlpha:(float)alpha;
+(UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;
+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size;
+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size withAlpha:(float)alpha;

@end
