//
//  AppDelegate+RootController.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/19.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "IndexViewController.h"
#import "FinancialViewController.h"
#import "LoanViewController.h"
#import "AccountViewController.h"
#import "AppDefaultUtil.h"

@interface AppDelegate ()<RDVTabBarControllerDelegate,UIScrollViewDelegate,UITabBarControllerDelegate>

@end



@implementation AppDelegate (RootController)

- (void)setAppWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = ColorBG;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

- (void)setRootViewController
{
    //判断是否第一次启动
    if ([[AppDefaultUtil sharedInstance] isFirstLancher])
    {
        UIViewController *emptyView = [[ UIViewController alloc ]init ];
        self.window.rootViewController = emptyView;
        [self createGuideScrollView];
    }
    else
    {
        [self goToMain];
    }
}


- (void)setRoot
{
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    navController.navigationBar.shadowImage = [[UIImage alloc] init];
    [navController.navigationBar setTranslucent:NO];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:ColorNavTitle}];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [navController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:FontNavTitle,NSForegroundColorAttributeName:ColorNavTitle}];
    
    navController.navigationBar.barTintColor = ColorNavBG;
    navController.navigationBar.tintColor = ColorNavTitle;
    
    self.window.rootViewController = navController;
}




#pragma mark RDVTabbarController delegate
- (void)setTabbarController
{
    
    
    IndexViewController *indexVC = [[IndexViewController alloc] init];
    
    FinancialViewController *financialVC  = [[FinancialViewController alloc] init];
    
    LoanViewController *loanVC = [[LoanViewController alloc]init];
    
    AccountViewController *accountVC = [[AccountViewController alloc]init];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[indexVC,financialVC,loanVC,accountVC]];
    self.viewController = tabBarController;
    tabBarController.delegate = self;
    [self customizeTabBarForController:tabBarController];
}

- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[IndexViewController class]])
    {
        tabBarController.navigationItem.title = @"首页";
    }
    if ([viewController isKindOfClass:[FinancialViewController class]])
    {
        tabBarController.navigationItem.title = @"理财";
    }
    if ([viewController isKindOfClass:[LoanViewController class]])
    {
        tabBarController.navigationItem.title = @"借款";
    }
    if ([viewController isKindOfClass:[AccountViewController class]])
    {
        tabBarController.navigationItem.title = @"帐户";
        
    }
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WidthScreen, HeightLine)];
    lineView.backgroundColor = ColorLine;
    [[tabBarController tabBar] addSubview:lineView];

    
    UIImage *selectedBGImage = [UIImage imageWithColor:ColorWhite];
    UIImage *unSelectedBGImage = [UIImage imageWithColor:ColorWhite];
    NSArray *tabBarItemImages = @[@"tab_home",@"tab_investment",@"tab_loan",@"tab_account"];
    NSArray *selectedImages = @[@"tab_home_press",@"tab_investment_press",@"tab_loan_press",@"tab_account_press"];
    
    NSInteger index = 0;
    [[tabBarController tabBar] setTranslucent:YES];
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {
        [item setBackgroundSelectedImage:selectedBGImage withUnselectedImage:unSelectedBGImage];
        
        UIImage *selectedImage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
        UIImage *unselectedImage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
        item.titlePositionAdjustment = UIOffsetMake(0, 3);
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];

        NSDictionary *unseleAtrr = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:12],
                                     NSForegroundColorAttributeName: [UIColor grayColor],
                                     };
        NSDictionary *seleAtrr = @{
                                   NSFontAttributeName: [UIFont systemFontOfSize:12],
                                   NSForegroundColorAttributeName: ColorMain,
                                   };
        [item setUnselectedTitleAttributes:unseleAtrr];
        [item setSelectedTitleAttributes:seleAtrr];
        [item setTitle:@[@"首页",@"理财",@"借款",@"帐户"][index]];
        index++;
    }
}

#pragma mark - 引导页
- (void)createGuideScrollView
{//引导页
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.window.bounds];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.window.rootViewController.view addSubview:scrollView];
 
    NSArray *arr = @[@"guide_page1",@"guide_page2",@"guide_page3",@"guide_page4"];
    for (int i = 0; i<arr.count; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth*i, 0, WidthScreen, HeightScreen)];
        imageView.image = [UIImage imageNamed:arr[i]];
        [scrollView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        if (i == arr.count - 1)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake((WidthScreen/2)-50, HeightScreen-110, 100, 40);
            btn.backgroundColor = ColorMain;
            [btn setTitle:@"开始体验" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goToMain) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:btn];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    scrollView.contentSize = CGSizeMake(WidthScreen*arr.count, HeightScreen);
  
}

- (void)goToMain
{
    [self setRoot];
}


@end
