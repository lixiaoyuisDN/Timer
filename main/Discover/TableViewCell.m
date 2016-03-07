//
//  TableViewCell.m
//  Timer
//
//  Created by sunfeng on 16/2/24.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setTableModel:(TableViewModel *)talbeModel{
    _tableModel = talbeModel;
    _titale.text = talbeModel.title;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(269, 81, 82, 30)];
    [button setTitle:@"预告片" forState:UIControlStateNormal];
    button.layer.cornerRadius = 15;
    button.layer.borderWidth = 2;
    button.layer.borderColor = [UIColor blueColor].CGColor;
    button.backgroundColor = [UIColor clearColor];
    [self addSubview:button];
    NSMutableAttributedString *commonSpecial1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@人正在期待上映",talbeModel.wantedCount]];
    
    [commonSpecial1 addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",talbeModel.wantedCount].length)];
    
    _wantedCount.attributedText = commonSpecial1;
    _type.text = talbeModel.type;
    _director.text = talbeModel.director;
    NSMutableAttributedString *commonSpecial = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@日",talbeModel.rDay]];
    
    [commonSpecial addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",talbeModel.rDay].length)];
    
    _rDay.attributedText = commonSpecial;


}

-(void)setModel:(HotModel *)model{
    
    _model = model;
    
    _title.text = model.t;
    
    //字符串多样化显示
    NSMutableAttributedString *mutableStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",model.r]];
    

    //6.9
    if (mutableStr.length == 3) {
        
        [mutableStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(1, 2)];
        
        //设置label的属性文本
        _rating.attributedText = mutableStr;
        
    } else {
        
        //评分为-1的
        if ([model.r floatValue] <= 0) {
            //将model中的评分修改
            model.r = 0;
            
        }
        
        _rating.text = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%.1f",[model.r floatValue]]];
        
        
    }
    
    if ([model.commonSpecial isEqualToString:@""]) {
        
        NSMutableAttributedString *commonSpecial = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@人正在期待上映",model.wantedCount]];
        
        [commonSpecial addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",model.wantedCount].length)];
        
        _comment.attributedText = commonSpecial;
        
    } else {
        
        _comment.text = model.commonSpecial;
        
    }
    
    /*
     设置时间格式
     */
    NSString *origins = [NSString stringWithFormat:@"%@",model.rd]; //20140903
    NSDateFormatter *fomate = [[NSDateFormatter alloc] init];
    [fomate setDateFormat:@"yyyyMMdd"];
    NSDate *date = [fomate dateFromString:origins];
    [fomate setDateFormat:@"MM月dd日"];
    NSString*news =  [fomate stringFromDate:date];
    _time.text = [NSString stringWithFormat:@"%@上映",news];
    
    _count.text = [NSString stringWithFormat:@"今日%@家影院 %@场",model.NearestCinemaCount,model.NearestShowtimeCount];
    
    
    UIImage *image1 = [UIImage imageNamed:@"icon_hot_show_IMAX3D"];
    UIImage *image2 = [UIImage imageNamed:@"icon_hot_show_IMAX"];
    UIImage *image3 = [UIImage imageNamed:@"icon_hot_show_DMAX"];
    
    if ([model.is3D intValue] == 1) {
        _image1.image = image1;
    }else {
        _image1.image = image2;
    }
    
    if ([model.isIMAX intValue] == 1 && [model.is3D intValue] == 1) {
        _image2.image = image2;
    }else {
        _image2.image = image3;
    }
    
    if ([model.isDMAX intValue] == 1 && [model.is3D intValue] == 1 && [model.isIMAX intValue] == 1) {
        _image3.image = image3;
    }else {
        _image3.hidden = YES;
    }
    

    
    
    
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
