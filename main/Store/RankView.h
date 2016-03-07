//
//  RankView.h
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic ,copy)NSString *topListNameCn;
@property(nonatomic ,retain)NSArray *dataList1;
@end
