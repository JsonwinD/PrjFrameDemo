//
//  TestViewController.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/6.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
{
    int _curPage;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];

}

-(void)requestData{
    _curPage = 1;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //获取债权转让列表信息，包含债权转让列表 (opt=30)
    [parameters setObject:@"30" forKey:@"OPT"];
    [parameters setObject:@"" forKey:@"body"];
    [parameters setObject:@"0" forKey:@"apr"]; //年利率  0 全部
    [parameters setObject:@"0" forKey:@"debtAmount"]; //借款金额
    [parameters setObject:@"" forKey:@"loanType"];    //借款类型
    [parameters setObject:@"0" forKey:@"orderType"];  //排序类型
    [parameters setObject:@"" forKey:@"keywords"];   //关键字	借款标题或编号
    [parameters setObject:[NSString stringWithFormat:@"%d",_curPage] forKey:@"currPage"];  //当前页数
    

    [self.netClient requestGet:@"app/services" withParameters:parameters];
}

-(void)httpResponseSuccess:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didSuccessWithObject:(id)obj{
    NSLog(@"%@",obj);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
