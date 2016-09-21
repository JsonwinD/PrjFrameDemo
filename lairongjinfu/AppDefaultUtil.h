//
//  AppDefaultUtil.h
//  lairongjinfu
//
//  Created by Jaqen on 2016/9/21.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDefaultUtil : NSObject

/**
 单例模式，实例化对象
 */
+ (instancetype)sharedInstance;

// 设置是否记住密码
-(void) setRemeberUser:(BOOL)value;

// 获取用户是否记住密码
-(BOOL) isRemeberUser;

// 获取用户是否是首次登录（更新或重装）
-(BOOL) isFirstLancher;


@end
