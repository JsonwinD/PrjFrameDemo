//
//  HJViewControllerBasicWithTableView.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/5.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "HJViewControllerBasicWithTableView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface HJViewControllerBasicWithTableView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@implementation HJViewControllerBasicWithTableView

-(id)init{
    self=[super init];
    if(self){
        self.DZNemptyStatus = 0;
        [self initRefreshView];
        
        //在根控制器中已经init tableView，子控制器中只需设置frame等属性
        self.tableView = [[UITableView alloc] init];
        self.tableView.emptyDataSetSource = self;
        self.tableView.emptyDataSetDelegate = self;
        self.tableView.mj_header = self.gifHeader;
        self.tableView.mj_footer = self.gifFooter;
        
        self.tableView.tableFooterView = [UIView new];
    }
    return self;
}

#pragma mark 初始化 mj_refresh 刷新视图
- (void)initRefreshView{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    self.gifHeader = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    
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
    self.gifFooter = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    // Hide the status
    self.gifFooter.stateLabel.hidden = YES;
    // 设置普通状态的动画图片
    [self.gifFooter setImages:refreshDownImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [self.gifFooter setImages:refreshDownImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self.gifFooter setImages:refreshDownImages forState:MJRefreshStateRefreshing];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark 上拉刷新、下拉更多、隐藏刷新视图
- (void)headerRereshing{
    
}
- (void)footerRereshing{
    
}

/**
 *  隐藏刷新视图
 */
-(void) hiddenRefreshView
{
    if (!self.tableView.mj_header.hidden) {
        [self.tableView.mj_header endRefreshing];
    }
    
    if (!self.tableView.mj_footer.hidden) {
        [self.tableView.mj_footer endRefreshing];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - emptyDataSetDelegate
/**
 *  是否允许滚动，默认NO
 */
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

/**
 *  空白页代理，显示自定义视图（动态图）
 */
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    
    UIView *loadingView;
    UIImageView *imgView;
    if (self.DZNemptyStatus == 0) {
        //加入你自定义的view
        loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WidthScreen, 143)];
        
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake((WidthScreen-150)/2, -143/2, 150, 143)];
        //imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.animationImages = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"loading-1"],
                                   [UIImage imageNamed:@"loading-2"],
                                   [UIImage imageNamed:@"loading-3"],
                                   [UIImage imageNamed:@"loading-4"],nil];
        
        // all frames will execute in 1.75 seconds
        imgView.animationDuration = 0.5;
        // repeat the annimation forever
        imgView.animationRepeatCount = 0;
        // start animating
        [imgView startAnimating];
        
        [loadingView addSubview:imgView];
        
    }
    return loadingView;
}


/**
 *  空白页代理方法，显示图片
 */
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    UIImage *noData = [UIImage imageNamed:@"noData"];
    UIImage *netError = [UIImage imageNamed:@"netError"];
    
    UIImage *resultImg = [[UIImage alloc] init];
    switch (self.DZNemptyStatus) {
        case 1:
        {
            resultImg = noData;
        }
            break;
        case 2:
        {
            resultImg = netError;
        }
            break;
        case 3:
        {
            resultImg = netError;
        }
            break;
        case 4:
        {
            resultImg = netError;
        }
            break;
        default:
            break;
    }
    return resultImg;
}

/**
 *  空白页代理方法，显示按钮图片
 */
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    
    if (self.DZNemptyStatus > 1) {
        return [UIImage imageNamed:@"reloading"];
    }
    return nil;
}

/**
 *  空白页按钮点击事件-重新请求数据
 */
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
    [self requestData];
}


/**
 *  解决空白页代理图片显示偏移问题
 */
-(void)emptyDataSetWillAppear:(UIScrollView *)scrollView{
    scrollView.contentOffset = CGPointZero;
}


/*
 //按钮文本
 - (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
 NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
 NSString *text = @"";
 
 switch (self.DZNemptyStatus) {
 case 0:
 {
 text = @"正在请求数据";
 }
 break;
 case 1:
 {
 text = @"暂无数据";
 }
 break;
 case 2:
 {
 text = @"请求失败，数据异常";
 }
 break;
 case 3:
 {
 text = @"请求失败，服务器异常";
 }
 break;
 case 4:
 {
 text = @"请求失败，网络异常";
 }
 break;
 default:
 break;
 }
 
 return [[NSAttributedString alloc] initWithString:text attributes:attributes];
 
 }
 
 
 //动态图
 - (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
 
 animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
 animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
 
 animation.duration = 0.25;
 animation.cumulative = YES;
 animation.repeatCount = MAXFLOAT;
 
 return animation;
 }
 
 //富文本
 - (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
 NSString *text = @"Please Allow Photo Access";
 
 NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
 
 return [[NSAttributedString alloc] initWithString:text attributes:attributes];
 }
 
 - (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
 NSString *text = @"This allows you to share photos from your library and save photos to your camera roll.";
 
 NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
 paragraph.lineBreakMode = NSLineBreakByWordWrapping;
 paragraph.alignment = NSTextAlignmentCenter;
 
 NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
 NSForegroundColorAttributeName: [UIColor lightGrayColor],
 NSParagraphStyleAttributeName: paragraph};
 
 return [[NSAttributedString alloc] initWithString:text attributes:attributes];
 }
 
 //按钮文本
 - (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
 NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
 
 return [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
 }
 
 - (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
 return [UIImage imageNamed:@"button_image"];
 }
 
 //自定义
 - (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
 //加入你自定义的view
 UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
 [activityView startAnimating];
 return activityView;
 }
 
 //是否显示空白页，默认YES
 - (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
 return YES;
 }
 
 //是否允许点击，默认YES
 - (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
 return YES;
 }
 
 //是否允许滚动，默认NO
 - (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
 return YES;
 }
 
 //图片是否要动画效果，默认NO
 - (BOOL) emptyDataSetShouldAllowImageViewAnimate:(UIScrollView *)scrollView {
 return YES;
 }
 
 //空白页点击事件
 - (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
 
 }
 
 //空白页按钮点击事件
 - (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
 
 }
 */



@end
