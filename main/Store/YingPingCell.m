//
//  YingPingCell.m
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "YingPingCell.h"

@implementation YingPingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(YingPingModel *)model{
    _model = model;
    _title.text = model.title;
    _summary.text = model.summary;
//    _nickname.text = [NSString stringWithFormat:@"%@-评   %@",model.nickname,];
    NSString *string = [model.relatedObj objectForKey:@"title"];
//    _relatedObj.text = string;
    _nickname.text = [NSString stringWithFormat:@"%@-评   %@",model.nickname,string];
    _rating.text = [NSString stringWithFormat:@"%@",model.rating];
    NSString *string2 = [model.relatedObj objectForKey:@"image"];
    [_image sd_setImageWithURL:[NSURL URLWithString:string2]];
    [_image2 sd_setImageWithURL:[NSURL URLWithString:model.userImage]];
}

@end
