//
//  YugaoView.h
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YugaoView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic ,copy)NSString *movieName,*summary,*coverImg;
@property(nonatomic ,retain)NSString *urL;


@property(nonatomic ,retain)NSArray *dataList1;
@end
