//
//  AViewCell.m
//  Timer
//
//  Created by bever on 16/2/27.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "AViewCell.h"

@implementation AViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _image = [[UIImageView alloc]initWithFrame:self.bounds];
        
        self.backgroundColor = [UIColor greenColor];
        [self addSubview:_image];
    }
    return self;
}

-(void)setModel:(HomeModel *)model{

    _model = model;
    [_image sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    
}
@end
