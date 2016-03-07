//
//  RankView.m
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "RankView.h"
#import "RankModel.h"
#import "RankCell.h"

@implementation RankView{
    
    UITableView *_tableView;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ceateTableView];
    }
    return self;
}

-(void)ceateTableView{
    _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self ceateButton];
    [self addSubview:_tableView];

}

-(void)ceateButton{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 150)];
    _tableView.tableHeaderView = view;
    [_tableView addSubview:view];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 120,100 )];
//    button1.backgroundColor = [UIColor greenColor];
    [button1 setImage:[UIImage imageNamed:@"v10_MtimeTop100@3x"] forState:UIControlStateNormal];
    [view addSubview:button1];
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(130, 20, 120,100 )];
//    button2.backgroundColor = [UIColor greenColor];
    [button2 setImage:[UIImage imageNamed:@"v10_ChineseTop100@3x"] forState:UIControlStateNormal];
    [view addSubview:button2];
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(245, 20, 120,100 )];
//    button3.backgroundColor = [UIColor greenColor];
    [button3 setImage:[UIImage imageNamed:@"v10_GlobalTopList@3x"] forState:UIControlStateNormal];
    [view addSubview:button3];
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 120, 30)];
    lable1.text = @"时光Top100";
    lable1.font = [UIFont systemFontOfSize:20];
    lable1.textColor = [UIColor redColor];
    [view addSubview:lable1];
    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 120, 120, 30)];
    lable2.text = @"华语Top100";
    lable2.font = [UIFont systemFontOfSize:20];
    lable2.textColor = [UIColor whiteColor];
    [view addSubview:lable2];
    UILabel *lable3 = [[UILabel alloc] initWithFrame:CGRectMake(265, 120, 120, 30)];
    lable3.text = @"全球票房榜";
    lable3.font = [UIFont systemFontOfSize:20];
    lable3.textColor = [UIColor orangeColor];
    [view addSubview:lable3];
    
    
    

}

//-(void)setDataList1:(NSArray *)dataList1{
//    _dataList1 = dataList1;
//    [_tableView reloadData];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList1.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RankModel *model = _dataList1[indexPath.row];
    RankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RankCell" owner:nil options:nil]firstObject];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.model = model;
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


@end
