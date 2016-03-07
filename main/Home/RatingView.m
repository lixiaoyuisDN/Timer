//
//  RatingView.m
//  Timer
//
//  Created by bever on 16/2/20.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView{
    UIView *_garyView;
    UIView *_yellowView;

}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self createStarView];

}

-(void)createStarView{

    UIImage *gary = [UIImage imageNamed:@"gray@2x"];
    UIImage *yellow = [UIImage imageNamed:@"yellow@2x"];
    
    //1.获取宽度和高度
    CGFloat width = gary.size.width * 5;
    CGFloat height = gary.size.height;
    
    //2.初始化星星
    _garyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    [_garyView setBackgroundColor:[UIColor colorWithPatternImage:gary]];
    
    [self addSubview:_garyView];
    
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    [_yellowView setBackgroundColor:[UIColor colorWithPatternImage:yellow]];
    [self addSubview:_yellowView];
    
    //3.放大
    CGFloat scale_W = self.frame.size.width/width;
    CGFloat sccle_H = self.frame.size.height/height;
    _garyView.transform = CGAffineTransformMakeScale(scale_W, sccle_H);
    _yellowView.transform = CGAffineTransformMakeScale(scale_W, sccle_H);
    
    //4.重新设置frame
    _garyView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _yellowView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
}

//注意，当调用setRating方法时，_rating才有值，重新设置黄色星星视图的frame
-(void)setRating:(float)rating{
    _rating = rating;
    
    _yellowView.frame = CGRectMake(0, 0, self.frame.size.width * _rating / 10, self.frame.size.height);
    
    
}


@end
