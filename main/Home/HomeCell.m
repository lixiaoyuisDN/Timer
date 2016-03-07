//
//  HomeCell.m
//  Timer
//
//  Created by sunfeng on 16/2/20.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
    
    
}

//给cell中的控件赋值,复写setModel方法
-(void)setModel:(HomeModel *)model{
    
    _model = model;
    
    
    //赋值
    _titleLabel.text = _model.titleCn;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    if ([_model.ratingFinal floatValue] <= 0) {
        _rating.text = @"0";
        _ratingView.rating = 0;
    }else {
        _rating.text = [NSString stringWithFormat:@"%@",_model.ratingFinal];
        _ratingView.rating = [_model.ratingFinal floatValue];
    }
    
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
