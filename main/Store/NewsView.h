//
//  NewsView.h
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,retain)NSArray *dataList1;

@end
