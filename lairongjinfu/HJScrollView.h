//
//  HJScrollView.h 带刷新控件的scrollView
//  lairongjinfu
//
//  Created by Jaqen on 16/9/5.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJScrollView : UIScrollView

/**
 *  mj_refresh 头尾刷新视图
 */
@property (nonatomic,strong) MJRefreshGifHeader *gifHeader;
@property (nonatomic,strong) MJRefreshBackGifFooter *gifFooter;

-(instancetype)initWithFrame:(CGRect)frame andDelegate:(id)delegate;

-(void) hiddenRefreshView;

@end
