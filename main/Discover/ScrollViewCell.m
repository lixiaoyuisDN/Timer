//
//  ScrollViewCell.m
//  Timer
//
//  Created by bever on 16/2/25.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "ScrollViewCell.h"

@implementation ScrollViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setTableModel:(TableViewModel *)talbeModel{

    _tableModel = talbeModel;
    _title.text = talbeModel.title;
    
    NSMutableAttributedString *commonSpecial1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"主演：%@,%@",talbeModel.actor1,talbeModel.actor2]];
    
    [commonSpecial1 addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@,%@",talbeModel.actor1,talbeModel.actor2].length)];
    
    _actor1.attributedText = commonSpecial1;
    
    _director.text = talbeModel.director;
    
    NSMutableAttributedString *commonSpecial = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@人正在期待上映",talbeModel.wantedCount]];
    
    [commonSpecial addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",talbeModel.wantedCount].length)];
    
    _wantedCount.attributedText = commonSpecial;
    
    _type.text = talbeModel.type;


    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
