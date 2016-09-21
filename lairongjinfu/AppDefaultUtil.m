//
//  AppDefaultUtil.m
//  lairongjinfu
//
//  Created by Jaqen on 2016/9/21.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "AppDefaultUtil.h"

#define KEY_FIRST_LANCHER_VERSION @"FirstLancherVersion" // 记录用户是否首次登录时的版本号

#define KEY_REMEBER_USER @"RemeberUser" //  记住用户

@interface AppDefaultUtil()

@end

@implementation AppDefaultUtil

+ (instancetype)sharedInstance {
    
    static AppDefaultUtil *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[AppDefaultUtil alloc] init];
        
    });
    
    return _sharedClient;
}

// 设置是否记住密码
-(void) setRemeberUser:(BOOL)value
{
    [kUserDefaults setBool:value forKey:KEY_REMEBER_USER];
    [kUserDefaults synchronize];
}

-(BOOL) isRemeberUser
{
    return [kUserDefaults boolForKey:KEY_REMEBER_USER];
}

-(BOOL) isFirstLancher
{
    NSString *oldVersion=[kUserDefaults objectForKey:KEY_FIRST_LANCHER_VERSION];
    NSComparisonResult result=[kAppVersion compare:oldVersion];
    if(result == NSOrderedDescending){
        // 保存首次登录时的版本号
        [kUserDefaults setObject:kAppVersion forKey:KEY_FIRST_LANCHER_VERSION];
        [kUserDefaults synchronize];
        return YES;
    }
    return NO;
}



@end
