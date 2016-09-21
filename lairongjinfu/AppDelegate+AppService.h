//
//  AppDelegate+AppService.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/19.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>

@interface AppDelegate (AppService)

/**
 *  bug日志反馈
 */
- (void)registerBugly;

@end
