//
//  AppDelegate.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/2.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+AppService.h"
#import "AppDelegate+AppLifeCircle.h"
#import "AppDelegate+RootController.h"



@interface AppDelegate ()
@end

@implementation AppDelegate

+ (UINavigationController *)rootNavigationController
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return (UINavigationController *)app.window.rootViewController;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setAppWindows];
    [self setTabbarController];
    [self setRootViewController];
    
    [self registerBugly];
    
    return YES;
}


@end
