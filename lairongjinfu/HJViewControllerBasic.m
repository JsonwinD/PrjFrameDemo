//
//  HJViewControllerBasic.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/5.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "HJViewControllerBasic.h"

@interface HJViewControllerBasic ()

@end

@implementation HJViewControllerBasic

-(id)init{
    self=[super init];
    if(self){
        self.navgationState=NavgationStateWithBack;
    }
    return self;
}

/**
 *  设置navgation的样式
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    switch (self.navgationState) {
        case NavgationStateWithBack:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
            self.navigationController.navigationBar.hidden=NO;
            self.navigationController.navigationBar.translucent=NO;
            [self.navigationController.navigationBar setBarTintColor:ColorWhite];
            [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:ColorNavTitle, NSForegroundColorAttributeName,FontNavTitle, NSFontAttributeName, nil]];
            
            // 导航条返回按钮
            UIBarButtonItem *barButtonLeft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bar_left"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            [self.navigationItem setLeftBarButtonItem:barButtonLeft];
        }
            break;
        case NavgationStateWithoutBack:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
            self.navigationController.navigationBar.hidden=NO;
            self.navigationController.navigationBar.translucent=NO;
            [self.navigationController.navigationBar setBarTintColor:ColorWhite];
            [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:ColorNavTitle, NSForegroundColorAttributeName,FontNavTitle, NSFontAttributeName, nil]];
        }
            break;
        case NavgationStateHide:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            self.navigationController.navigationBar.hidden=YES;
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 *  退出当前控制器
 */
-(void)back{
    [self.view endEditing:YES];
    if(self.navigationController.viewControllers.count>1){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
