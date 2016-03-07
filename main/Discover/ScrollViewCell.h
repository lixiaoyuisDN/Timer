//
//  ScrollViewCell.h
//  Timer
//
//  Created by bever on 16/2/25.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewModel.h"

@interface ScrollViewCell : UITableViewCell
@property (nonatomic ,strong)TableViewModel *tableModel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *wantedCount;
@property (weak, nonatomic) IBOutlet UILabel *director;
@property (weak, nonatomic) IBOutlet UILabel *actor1;
@property (weak, nonatomic) IBOutlet UILabel *type;

@property (nonatomic ,copy)NSString *actor2;

@end
//"id": 206789,
//"title": "道士下山",
//"image": "http://img31.mtime.cn/mt/2015/06/24/105023.54733580_1280X720X2.jpg",
//"releaseDate": "7月3日上映",
//"rYear": 2015,
//"rMonth": 7,
//"rDay": 3,
//"type": "动作 | 剧情",
//"director": "陈凯歌",
//"actor1": "王宝强",
//"actor2": "郭富城",
//"locationName": "中国",
//"isTicket": true,
//"wantedCount": 3608,
//"videoCount": 3,
//"videos": [
