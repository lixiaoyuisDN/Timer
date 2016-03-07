//
//  YingPingView.m
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "YingPingView.h"
#import "YingPingCell.h"
#import "YingPingModel.h"

@implementation YingPingView{

    UITableView *_tableView;
    NSIndexPath *_indexPath;
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

    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    [self addSubview:_tableView];
    

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _dataList1.count;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YingPingModel *model = _dataList1[indexPath.row];
    YingPingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YingPingCell" owner:nil options:nil]firstObject];
    }
    cell.model = model;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //根据文本内容 返回选中的单元格的高度
    if ([indexPath isEqual:_indexPath]) {
        
        NSString *str = [_dataList1[indexPath.row] summary];
        
        //根据字符串 返回文本绘制所占据的矩形空间。
        //200 宽度  9999高度上限
        CGRect frame =[str boundingRectWithSize:CGSizeMake(200, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        return frame.size.height+50;
        
    }
    
    return 160;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _indexPath = indexPath;
    //UITableViewRowAnimationLeft 刷新时动画
#pragma mark - 指定刷新某些行(参数位置填的是数组)
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}


@end
