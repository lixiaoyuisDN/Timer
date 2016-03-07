           //
//  CitiesCollectionViewCell.m
//  Timer
//
//  Created by bever on 16/2/23.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "CitiesCollectionViewCell.h"
#import "citiesModel.h"

@implementation CitiesCollectionViewCell{
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLabel];
        //        label.text = @"hello";
        //设置圆角
        self.layer.cornerRadius = 10;
        
        //设置紫色边线
        self.layer.borderColor = [[UIColor purpleColor] CGColor];
        //边线宽度
        self.layer.borderWidth = 3;
        
        //边缘裁剪
        self.clipsToBounds = YES;
        
    }
    return self;
}

- (void)createLabel{
    _label = [[UILabel alloc] initWithFrame:self.bounds];
    
    _label.backgroundColor = [UIColor blackColor];
    _label.alpha = 0.5;
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont boldSystemFontOfSize:18];
    [self addSubview:_label];
    
}

-(void)setModel:(citiesModel *)model {
    _model = model;
    
    _label.text = model.name;
    
    
}


@end
