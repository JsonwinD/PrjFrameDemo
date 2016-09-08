//
//  HJViewControllerBasicWithTableView.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/5.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "HJViewControllerBasicWithNetwork.h"

@interface HJViewControllerBasicWithTableView : HJViewControllerBasicWithNetwork

/**
 *  默认tableView，子控制器中无需初始化，已设置空白代理，刷新视图，
 */
@property (nonatomic,strong) UITableView *tableView;

/**
 *  mj_refresh 头尾刷新视图，已初始化，子控制器如有需要直接调用
 */
@property (nonatomic,strong) MJRefreshGifHeader *gifHeader;
@property (nonatomic,strong) MJRefreshBackGifFooter *gifFooter;

/**
 *  0:正在请求数据
 *  1:请求成功，无数据
 *  2:请求成功，error
 *  3:请求失败，服务器返回数据异常
 *  4:请求失败，网络异常
 */
@property (nonatomic,assign) int DZNemptyStatus;

/**
 *  上拉刷新,下拉更多方法,子类重写该方法
 */
- (void)headerRereshing;

- (void)footerRereshing;

/**
 *  隐藏头尾刷新视图，带tableView的子控制器无需重写
 */
- (void)hiddenRefreshView;

@end
