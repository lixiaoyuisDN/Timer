//
//  YugaoView.m
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "YugaoView.h"
#import "YugaoModel.h"
#import "YugaoCell.h"
#import "UIViewExt.h"
#import "YgaoViewController1.h"
#import "UIView+viewController.h"


@implementation YugaoView{
    
    UITableView *_tableView;
    UIImageView *_image;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ceateTableView];
        
        
    }
    return self;
}

-(void)ceateTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
//    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"window"]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    _image.image = [UIImage imageNamed:@"window"];
    [_tableView addSubview:_image];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_W/4, 160, kScreen_W/2, 40)];
    lable.text = @"《蚁人》国际版终极预告";
    lable.backgroundColor = [UIColor greenColor];
    
    [view addSubview:lable];
    _tableView.tableHeaderView = view;
    
    [self addSubview:_tableView];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    
    
    if (y<0) {
        _image.height=200+ABS(y);
        _image.top =y;
//        _image.left = -y;
//        _image.right =ABS(y);
    }
    


 }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YugaoModel *model = _dataList1[indexPath.item];
    YugaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YugaoCell" owner:nil options:nil]firstObject];
    }
    cell.model = model;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    YugaoModel *model = _dataList1[indexPat.item];
    _urL = model.url;
    YgaoViewController1 *yugaoView = [[YgaoViewController1 alloc] init];
    yugaoView.wangzhi = _urL;
    yugaoView.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:yugaoView animated:YES];
    
}


@end
