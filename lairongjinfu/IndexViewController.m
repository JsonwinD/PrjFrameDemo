//
//  IndexViewController.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/7.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "IndexViewController.h"
#import "SDCycleScrollView.h"
#import <UIImageView+WebCache.h>
#import "HJScrollView.h"

@interface IndexViewController ()<SDCycleScrollViewDelegate,UIScrollViewDelegate>
{
    
}

@property (nonatomic,strong) HJScrollView *rootScrollView;

@end

@implementation IndexViewController

- (void)viewWillAppear:(BOOL)animated{
    [self initNavgation];
    [super viewWillAppear:animated];
    [self initData];
}

- (void)initNavgation{
    self.navgationState = NavgationStateHide;
}

- (void)initData{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    _rootScrollView = [[HJScrollView alloc] initWithFrame:self.view.frame andDelegate:self];
    
    [self.view addSubview:_rootScrollView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    
    
    /**
     *  广告轮播图
     */
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WidthScreen, WidthScreen/2.2) delegate:self placeholderImage:[UIImage imageNamed:@"news_image_default"]];
    cycleScrollView.imageURLStringsGroup = @[@"http://f.hiphotos.baidu.com/zhidao/pic/item/f636afc379310a553e7a868db74543a982261068.jpg",@"http://f.hiphotos.baidu.com/zhidao/pic/item/f636afc379310a553e7a868db74543a982261068.jpg"];
    //轮播图点击事件
    cycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex){
        NSLog(@"%ld",(long)currentIndex);
    };
    [_rootScrollView addSubview:cycleScrollView];
}

-(void)headerRereshing{
    NSLog(@"=============");
    [_rootScrollView hiddenRefreshView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
