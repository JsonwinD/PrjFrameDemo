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

@interface AppDelegate ()<RDVTabBarControllerDelegate,UIScrollViewDelegate,UITabBarControllerDelegate>

@end



@implementation AppDelegate (RootController)
- (void)setRootViewController
{
    //判断是否第一次启动
    if ([kUserDefaults objectForKey:@"isFirstLaunch"])
    {
        //[self checkBlack];
        [self setRoot];
    }
    else
    {
        UIViewController *emptyView = [[ UIViewController alloc ]init ];
        self.window.rootViewController = emptyView;
        [self createGuideScrollView];
    }
}

- (void)setRoot
{
    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    navc.navigationBar.barTintColor = ColorRedMain;
    
    navc.navigationBar.shadowImage = [[UIImage alloc] init];
    [navc.navigationBar setTranslucent:NO];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:ColorNavTitle}];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:FontNavTitle,NSForegroundColorAttributeName:ColorNavTitle}];
    navc.navigationBar.tintColor = ColorNavTitle;
    self.window.rootViewController = navc;
}




#pragma mark - Windows
- (void)setTabbarController
{
    
    
    IndexViewController *indexVC = [[IndexViewController alloc] init];
    //    UINavigationController *schoolNav = [[UINavigationController alloc]initWithRootViewController:school];
    
    FinancialViewController *financialVC  = [[FinancialViewController alloc] init];
    //    UINavigationController *chidNav = [[UINavigationController alloc]initWithRootViewController:child];
    
    LoanViewController *loanVC = [[LoanViewController alloc]init];
    //    UINavigationController *eduNav = [[UINavigationController alloc]initWithRootViewController:edu];
    
    AccountViewController *accountVC = [[AccountViewController alloc]init];
    //    UINavigationController *courseListNav = [[UINavigationController alloc]initWithRootViewController:courseList];
    
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
    UIImage *selectedBGImage = [UIImage imageWithColor:ColorWhite];
    UIImage *unSelectedBGImage = [UIImage imageWithColor:ColorWhite];
    NSArray *tabBarItemImages = @[@"tab_home",@"tab_investment",@"tab_loan",@"tab_account"];
    NSArray *selectedImages = @[@"tab_home",@"tab_investment",@"tab_loan",@"tab_account"];
    
    NSInteger index = 0;
    [[tabBarController tabBar] setTranslucent:YES];
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {
        [item setBackgroundSelectedImage:selectedBGImage withUnselectedImage:unSelectedBGImage];
        
        UIImage *selectedImage = [UIImage imageNamed:[selectedImages objectAtIndex:index]];
        UIImage *unselectedImage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
        item.titlePositionAdjustment = UIOffsetMake(0, 5);
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
        
        NSDictionary *unseleAtrr = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:11],
                                     NSForegroundColorAttributeName: [UIColor grayColor],
                                     };
        NSDictionary *seleAtrr = @{
                                   NSFontAttributeName: [UIFont systemFontOfSize:11],
                                   NSForegroundColorAttributeName: ColorRedMain,
                                   };
        [item setUnselectedTitleAttributes:unseleAtrr];
        [item setSelectedTitleAttributes:seleAtrr];
        [item setTitle:@[@"首页",@"理财",@"借款",@"帐户"][index]];
        index++;
    }
}
- (void)setAppWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = ColorBGGray;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
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
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageNamed:arr[i]];
        [scrollView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        if (i == arr.count - 1)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake((kScreenWidth/2)-50, kScreenHeight-110, 100, 40);
            btn.backgroundColor = ColorRedMain;
            [btn setTitle:@"开始体验" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goToMain) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:btn];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = ColorRedMain.CGColor;
        }
    }
    scrollView.contentSize = CGSizeMake(kScreenWidth*arr.count, kScreenHeight);
  
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x>kScreenWidth *4+30)
    {
        [self goToMain];
    }
}

- (void)goToMain
{
    //NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [kUserDefaults setObject:@"isFirstLaunch" forKey:@"isFirstLaunch"];
    [kUserDefaults synchronize];
    [self setRoot];
    // self.window.rootViewController = self.viewController;
}


@end
