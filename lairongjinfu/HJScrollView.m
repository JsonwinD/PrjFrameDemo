//
//  HJScrollView.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/5.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "HJScrollView.h"

@interface HJScrollView()



@end

@implementation HJScrollView

-(instancetype)initWithFrame:(CGRect)frame andDelegate:(id)delegate{
    if (self = [super initWithFrame:frame]) {
        self.delegate = delegate;
        [self initRefreshView];
        self.mj_header = self.gifHeader;
    }
    
    return self;
}

- (void)initRefreshView{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    self.gifHeader = [MJRefreshGifHeader headerWithRefreshingTarget:self.delegate refreshingAction:@selector(headerRereshing)];
    
    UIImage *image1 = [UIImage imageNamed:@"loadingup-1"];
    UIImage *image2 = [UIImage imageNamed:@"loadingup-2"];
    UIImage *image3 = [UIImage imageNamed:@"loadingup-3"];
    UIImage *image4 = [UIImage imageNamed:@"loadingup-4"];
    UIImage *image5 = [UIImage imageNamed:@"loadingup-5"];
    UIImage *image6 = [UIImage imageNamed:@"loadingup-6"];
    NSArray *refreshImages = [NSArray arrayWithObjects:image1,image2,image3,image4,image5,image6, nil];
    // Hide the time
    self.gifHeader.lastUpdatedTimeLabel.hidden = YES;
    // Hide the status
    self.gifHeader.stateLabel.hidden = YES;
    // 设置普通状态的动画图片
    [self.gifHeader setImages:refreshImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [self.gifHeader setImages:refreshImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self.gifHeader setImages:refreshImages forState:MJRefreshStateRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    UIImage *imageDown1 = [UIImage imageNamed:@"loadingdown-1"];
    UIImage *imageDown2 = [UIImage imageNamed:@"loadingdown-2"];
    UIImage *imageDown3 = [UIImage imageNamed:@"loadingdown-3"];
    UIImage *imageDown4 = [UIImage imageNamed:@"loadingdown-4"];
    UIImage *imageDown5 = [UIImage imageNamed:@"loadingdown-5"];
    
    NSArray *refreshDownImages = [NSArray arrayWithObjects:imageDown1,imageDown2,imageDown3,imageDown4,imageDown5, nil];
    self.gifFooter = [MJRefreshBackGifFooter footerWithRefreshingTarget:self.delegate refreshingAction:@selector(footerRereshing)];
    // Hide the status
    self.gifFooter.stateLabel.hidden = YES;
    // 设置普通状态的动画图片
    [self.gifFooter setImages:refreshDownImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [self.gifFooter setImages:refreshDownImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self.gifFooter setImages:refreshDownImages forState:MJRefreshStateRefreshing];
    
    
}

/**
 *  隐藏刷新视图
 */
-(void) hiddenRefreshView
{
    if (!self.mj_header.hidden) {
        [self.mj_header endRefreshing];
    }
    
    if (!self.mj_footer.hidden) {
        [self.mj_footer endRefreshing];
    }
}

-(void)viewDidLoad{
    
}

@end
