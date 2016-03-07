//
//  PaytickrtCell.m
//  Timer
//
//  Created by bever on 16/2/29.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "PaytickrtCell.h"

@implementation PaytickrtCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPayticketModel:(PayticketModel *)payticketModel{

    _payticketModel = payticketModel;
    _cinameName.text = payticketModel.cinameName;
    _address.text = payticketModel.address;
    _minPrice.text = [NSString stringWithFormat:@"¥%.1f",[_payticketModel.minPrice floatValue]/100];
    
    int i = 0;
    if ([[_payticketModel.feature objectForKey:@"has3D"] isEqual:@0]) {
        _has3D.hidden = YES;
        i++;
    }
    //第一个图片隐藏之后，第二个图片，平移
    _hasIMAX.transform = CGAffineTransformMakeTranslation(-i*40, 0);
    
    if ([[_payticketModel.feature objectForKey:@"hasIMAX"] isEqual:@0]) {
        _hasIMAX.hidden = YES;
        i++;
    }
    _hasVIP.transform = CGAffineTransformMakeTranslation(-i*40, 0);
    
    if ([[_payticketModel.feature objectForKey:@"hasVIP"] isEqual:@0]) {
        _hasVIP.hidden = YES;
        i++;
    }
    
    _hasPark.transform = CGAffineTransformMakeTranslation(-i*40, 0);
    
    if ([[_payticketModel.feature objectForKey:@"hasPark"] isEqual:@0]) {
        _hasPark.hidden = YES;
        i++;
    }
    
    _hasServiceTicket.transform = CGAffineTransformMakeTranslation(-i*40, 0);
    
    if ([[_payticketModel.feature objectForKey:@"hasServiceTicket"] isEqual:@0]) {
        _hasServiceTicket.hidden = YES;
        i++;
    }
    
    _hasWifi.transform = CGAffineTransformMakeTranslation(-i*40, 0);
    if ([[_payticketModel.feature objectForKey:@"hasWifi"] isEqual:@0]) {
        _hasWifi.hidden = YES;
        i++;
    }


}

@end
