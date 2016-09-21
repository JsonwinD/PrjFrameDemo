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
    /**
     *  广告轮播图
     */
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -20, WidthScreen, WidthScreen/2.2) delegate:self placeholderImage:[UIImage imageNamed:@"news_image_default"]];
    cycleScrollView.imageURLStringsGroup = @[@"http://f.hiphotos.baidu.com/zhidao/pic/item/f636afc379310a553e7a868db74543a982261068.jpg",@"http://f.hiphotos.baidu.com/zhidao/pic/item/f636afc379310a553e7a868db74543a982261068.jpg"];
    //轮播图点击事件
    cycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex){
        NSLog(@"%ld",(long)currentIndex);
    };
    [self.view addSubview:cycleScrollView];
    
    /**
     *  带刷新滚动视图
     */
    _rootScrollView = [[HJScrollView alloc] initWithFrame:CGRectMake(0, cycleScrollView.bottom, WidthScreen, HeightScreen-cycleScrollView.bottom-HeightBottomToolBar) andDelegate:self];
    
    [self.view addSubview:_rootScrollView];
    
    
}

-(void)headerRereshing{
    NSLog(@"=============");
    [_rootScrollView hiddenRefreshView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
