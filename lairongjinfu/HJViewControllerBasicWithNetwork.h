//
//  HJViewControllerBasicWithNetwork.h
//  lairongjinfu
//
//  Created by Jaqen on 16/9/6.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "HJViewControllerBasic.h"
#import "NetWorkClient.h"
#import <MJRefresh.h>

@interface HJViewControllerBasicWithNetwork : HJViewControllerBasic<HTTPClientDelegate>

/**
 *  网络请求对象，已初始化，子控制器无需初始化，只需调用，实现代理方法即可
 */
@property (nonatomic,strong) NetWorkClient *netClient;


/**
 *  网络请求方法
 */
- (void)requestData;

/**
 *  网络请求代理方法
 */
-(void) startRequest;

-(void) httpResponseSuccess:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didSuccessWithObject:(id)obj;

-(void) httpResponseFailure:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didFailWithError:(NSError *)error;

-(void) networkError;




@end
