//
//  RankCell.h
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankModel.h"

@interface RankCell : UITableViewCell

@property (nonatomic ,retain)RankModel *model;
@property (weak, nonatomic) IBOutlet UILabel *tapListNameCn;

@end
