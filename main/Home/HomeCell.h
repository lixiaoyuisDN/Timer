//
//  HomeCell.h
//  Timer
//
//  Created by sunfeng on 16/2/20.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "RatingView.h"

@interface HomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet RatingView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *rating;

@property(nonatomic,strong)HomeModel *model;

@end
