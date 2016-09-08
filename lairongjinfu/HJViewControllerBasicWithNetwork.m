//
//  HJViewControllerBasicWithNetwork.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/6.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "HJViewControllerBasicWithNetwork.h"

@interface HJViewControllerBasicWithNetwork ()

@end

@implementation HJViewControllerBasicWithNetwork

-(instancetype)init{
    if (self = [super init]) {
        if (self.netClient == nil) {
            self.netClient = [[NetWorkClient alloc] init];
            self.netClient.delegate = self;
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



#pragma mark 网络请求方法
-(void)requestData{
    
}

#pragma mark 网络请求代理方法
-(void) startRequest{
    NSLog(@"开始请求");
}

-(void) httpResponseSuccess:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didSuccessWithObject:(id)obj{
    
}

-(void) httpResponseFailure:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didFailWithError:(NSError *)error{
    NSLog(@"请求出错");
}

-(void) networkError{
    NSLog(@"网络出错");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
