//
//  FinancialViewController.m
//  lairongjinfu
//
//  Created by Jaqen on 16/9/19.
//  Copyright © 2016年 lairong. All rights reserved.
//

#import "FinancialViewController.h"

@interface FinancialViewController ()<UITableViewDelegate,UITableViewDataSource,HTTPClientDelegate>
{
    NSMutableArray *_dataArray;
    int _curPage;
    BOOL _isRefresh;
}
@end

@implementation FinancialViewController

-(void)initNav{
    self.navgationState = NavgationStateHide;

}

-(void)viewWillAppear:(BOOL)animated{
    [self initNav];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    [self requestData];
    
}

-(void)initData{
    //_dataArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];
    _dataArray = [NSMutableArray array];
}

-(void)initView{
    self.tableView.frame = CGRectMake(HeightStateBar, 0, WidthScreen, HeightScreen-HeightNavigationAndStateBar-HeightBottomToolBar);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

-(void)requestData{
    _curPage = 1;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //2.1获取投资列表信息，包含投资列表。[OK]
    [parameters setObject:@"10" forKey:@"OPT"];
    [parameters setObject:@"" forKey:@"body"];
    [parameters setObject:@"0" forKey:@"apr"]; //年利率  0 全部
    [parameters setObject:@"0" forKey:@"amount"]; //借款金额
    [parameters setObject:@"0" forKey:@"loanSchedule"]; //投标进度
    [parameters setObject:@"" forKey:@"startDate"]; //开始日期
    [parameters setObject:@"" forKey:@"endDate"]; //结束日期
    [parameters setObject:@"-1" forKey:@"loanType"]; //借款类型
    [parameters setObject:@"-1" forKey:@"minLevelStr"]; //最低信用等级
    [parameters setObject:@"-1" forKey:@"maxLevelStr"]; //最高信用等级
    [parameters setObject:@"0" forKey:@"orderType"];  //排序类型
    [parameters setObject:@"" forKey:@"keywords"];   //关键字	借款标题或编号
    [parameters setObject:[NSString stringWithFormat:@"%d",_curPage] forKey:@"currPage"];  //当前页数
    
    [self.netClient requestGet:@"app/services" withParameters:parameters];
}

-(void)httpResponseSuccess:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didSuccessWithObject:(id)obj{
    NSLog(@"%@",obj);
    [self hiddenRefreshView];
    //[self.tableView reloadData];
}



-(void)headerRereshing{
    [self requestData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArray[indexPath.section];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
