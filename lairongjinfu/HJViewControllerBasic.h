//
//  HJViewControllerBasic.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/5.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  控制器NavgationBar的状态
 */
typedef NS_ENUM(NSInteger, NavgationStateNotNetwork){
    /**
     *  隐藏
     */
    NavgationStateHide,
    /**
     *  状态栏加返回按钮
     */
    NavgationStateWithBack,
    /**
     *  状态栏无返回按钮
     */
    NavgationStateWithoutBack,
};


@interface HJViewControllerBasic : UIViewController

/**
 *  控制器NavgationBar的状态（在[super viewWillAppear:animated]前定义）
 */
@property(nonatomic,assign)NavgationStateNotNetwork navgationState;

/**
 *  退出当前控制器
 */
-(void)back;

@end
