//
//  NewsView.m
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsView.h"
#import "StoreCell.h"
#import "NewsModel.h"
#import "NewsTableView.h"
#import "UIView+viewController.h"
#import "WuViewController.h"

@implementation NewsView{

    UITableView *_tableView;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)setDataList1:(NSArray *)dataList1{
    
    _dataList1 = dataList1;
    
    [self ceateTableView];
}

-(void)ceateTableView{
    _tableView = [[UITableView alloc] initWithFrame:self.frame];
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    [self addSubview:_tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataList1.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = _dataList1[indexPath.item];
    StoreCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    StoreCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    
    if (cell1 == nil | cell2 == nil) {
        cell1 = [[[NSBundle mainBundle] loadNibNamed:@"StoreCell" owner:nil options:nil]firstObject];
        cell2 = [[[NSBundle mainBundle] loadNibNamed:@"StoreCell" owner:nil options:nil]lastObject];
}
    
    if ([model.type integerValue] == 1 ) {
        cell2.model = model;
        return cell2;
    }
    
    cell1.model = model;
    return cell1;
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qqq"];
//    }
//    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_on@3x"]];
//    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModel *model = _dataList1[indexPath.row];
    
    if ([model.type intValue]==1) {
       
   
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"NewsTableView" bundle:nil];
//    UIViewController *con = [[UIViewController alloc] init];
        NewsTableView *newsVC = [story instantiateInitialViewController];
        //当控制器即将被push出来的时候，隐藏下部标签栏
        newsVC.hidesBottomBarWhenPushed = YES;
        //通过响应者链找到控制器
        [self.viewController.navigationController pushViewController:newsVC animated:YES];
        return;
    }
    WuViewController *webNews = [[WuViewController alloc] init];
    webNews.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:webNews animated:YES];
    

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
