//
//  CitiesHeaderCollectionReusableView.m
//  Timer
//
//  Created by bever on 16/2/23.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "CitiesHeaderCollectionReusableView.h"

@implementation CitiesHeaderCollectionReusableView{
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 50)];
        _label.backgroundColor = [UIColor grayColor];
        [self addSubview:_label];
        
    }
    return self;
}

-(void)setType:(NSString *)type{
    _type = type;
    _label.text = _type;
}


@end
