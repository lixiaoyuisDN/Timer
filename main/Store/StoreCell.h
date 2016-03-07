//
//  StoreCell.h
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface StoreCell : UITableViewCell
@property (nonatomic ,retain)NewsModel *model;
@property (nonatomic ,retain)NSNumber *type;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *title2;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;

@property (weak, nonatomic) IBOutlet UILabel *publishTime;


@property (weak, nonatomic) IBOutlet UILabel *title3;
@property (weak, nonatomic) IBOutlet UILabel *publishTime2;
@property (weak, nonatomic) IBOutlet UILabel *commentCount2;



@end


