//
//  NewsViewTable.m
//  Timer
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsViewTable.h"

@implementation NewsViewTable

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    [self setDic:_dic];

}
-(void)setDic:(NSDictionary *)dic{
    
    [_image sd_setImageWithURL:[NSURL URLWithString:@"http://img31.mtime.cn/mt/2015/07/02/111644.56181130_1280X720X2.jpg"]];

}

@end
