//
//  StoreViewController.m
//  Timer
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "StoreViewController.h"
#import "NewsView.h"
#import "YugaoView.h"
#import "RankView.h"
#import "YingPingView.h"

#import "NewsModel.h"
#import "YugaoModel.h"
#import "RankModel.h"
#import "YingPingModel.h"


@interface StoreViewController ()

@end

@implementation StoreViewController{

    SegmentView *_segmentView;
    NewsView *_newsView;
    YugaoView *_yugaoView;
    RankView *_rankView;
    YingPingView *_yingPingView;
    
    NSMutableArray *_dataList1;
    NSMutableArray *_dataList2;
    NSMutableArray *_dataList3;
    NSMutableArray *_dataList4;
    

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"商城";
        self.tabBarItem.image = [UIImage imageNamed:@"store"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor darkGrayColor];
    _segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, 44)];
    _segmentView.titleArray = @[@"新闻",@"预告片",@"排行榜",@"影评"];
    
    //添加点击事件
    __weak StoreViewController *weakSelf = self;
    [_segmentView addBlock:^(int index) {
        
        //
        StoreViewController *strongSelf = weakSelf;
        [strongSelf btnAction:index];
    }];
    
    self.navigationItem.titleView = _segmentView;
    
    [self loadData];
    [self ceateTableView];
    
}

#pragma mark - 切换视图
-(void)btnAction:(int)index{
    
    switch (index) {
            
        case 0:
            [self.view bringSubviewToFront:_newsView];
            break;
        case 1:
            [self.view bringSubviewToFront:_yugaoView];
            break;
        case 2:
            [self.view bringSubviewToFront:_rankView];
            break;
        case 3:
            [self.view bringSubviewToFront:_yingPingView];
            break;
        default:
            break;
    }
    
}


-(void)ceateTableView{
    
    _yugaoView = [[YugaoView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H-64-49)];
    _yugaoView.dataList1 = _dataList2;
    [self.view addSubview:_yugaoView];
    
    _rankView = [[RankView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H-64-49)];
    _rankView.dataList1 = _dataList3;
    [self.view addSubview:_rankView];
    
    
    _yingPingView = [[YingPingView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H-64-49)];
    _yingPingView.dataList1 = _dataList4;
    [self.view addSubview:_yingPingView];
    
    _newsView = [[NewsView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H-64-49)];
    _newsView.dataList1 = _dataList1;
    [self.view addSubview:_newsView];
}

-(void)loadData{
    //新闻
    _dataList1 = [[NSMutableArray alloc] init];
    
    NSDictionary *dic = [CoreDateFormJson jsonObjectFromFileName:@"find_news"];
    
    NSArray *newArray = [dic objectForKey:@"newsList"];
    
    for (NSDictionary *d in newArray) {
        NewsModel *model = [[NewsModel alloc] initWithDic:d];
        [_dataList1 addObject:model];
        
    }
    
    //预告片
    _dataList2 = [[NSMutableArray alloc] init];
    
    NSDictionary *dic2 = [CoreDateFormJson jsonObjectFromFileName:@"预告"];
    
    NSArray *yugaoArray = [dic2 objectForKey:@"trailers"];
    
    for (NSDictionary *d in yugaoArray) {
        YugaoModel *yugaoModel = [[YugaoModel alloc] initWithDic:d];
        [_dataList2 addObject:yugaoModel];
    }
    
    //排行榜
    _dataList3 = [[NSMutableArray alloc] init];
    
    NSDictionary *dic3 = [CoreDateFormJson jsonObjectFromFileName:@"rank2"];
    
    NSArray *rankArray = [dic3 objectForKey:@"topLists"];
    
    for (NSDictionary *d in rankArray) {
        RankModel *rankModel = [[RankModel alloc] initWithDic:d];
        NSLog(@"%@",rankModel.topListNameCn);
        [_dataList3 addObject:rankModel];
    }

    //影评
    _dataList4 = [[NSMutableArray alloc] init];
    
    NSArray *dic4 = [CoreDateFormJson jsonObjectFromFileName:@"criticism"];
//    NSArray *yingpingArray = [dic4 objectForKey:@"yingpingArray"];
    for (NSDictionary *d in dic4) {
        YingPingModel *yingpingModel = [[YingPingModel alloc] initWithDic:d];
        [_dataList4 addObject:yingpingModel];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
