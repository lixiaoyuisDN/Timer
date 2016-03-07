//
//  StoreCell.m
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "StoreCell.h"

@implementation StoreCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(NewsModel *)model{
    _model = model;
    
    if ([model.type integerValue]==1) {
        [self loadData1];
    }
    [self loadData2];

}

-(void)loadData1{
    
    _title3.text = _model.title;
    _commentCount2.text = [NSString stringWithFormat:@"%@条评论",_model.commentCount];
    float h = [_model.publishTime floatValue]/360000000;
    _publishTime2.text = [NSString stringWithFormat:@"%.f小时前评论",h];
    
}

-(void)loadData2{

    _title.text = _model.title;
    _title2.text = _model.title2;
    _commentCount.text = [NSString stringWithFormat:@"%@条评论",_model.commentCount];
    float h = [_model.publishTime floatValue]/360000000;
    _publishTime.text = [NSString stringWithFormat:@"%.f小时前评论",h];

}

@end
