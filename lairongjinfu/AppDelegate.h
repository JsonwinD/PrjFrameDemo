//
//  AppDelegate.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/2.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

+ (UINavigationController *)rootNavigationController;

@end

