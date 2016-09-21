//
//  AppDelegate+RootController.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/19.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (RootController)

/**
 *  window实例
 */
- (void)setAppWindows;
/**
 *  首次启动轮播图
 */
- (void)createGuideScrollView;
/**
 *  tabbar实例
 */
- (void)setTabbarController;

/**
 *  根视图
 */
- (void)setRootViewController;

@end
