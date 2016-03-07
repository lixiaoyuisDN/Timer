//
//  YugaoCell.m
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "YugaoCell.h"

@implementation YugaoCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(YugaoModel *)model{

    _model = model;
    _movieName.text = _model.movieName;
    _summary.text = _model.summary;
    [_image sd_setImageWithURL:[NSURL URLWithString:model.coverImg]];
    
    

}


@end
