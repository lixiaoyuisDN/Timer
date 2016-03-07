//
//  AViewCell.h
//  Timer
//
//  Created by bever on 16/2/27.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface AViewCell : UICollectionViewCell
@property(nonatomic,retain)HomeModel *model;
@property(nonatomic,retain)UIImageView *image;
@end
