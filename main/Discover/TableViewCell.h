//
//  TableViewCell.h
//  Timer
//
//  Created by sunfeng on 16/2/24.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotModel.h"
#import "TableViewModel.h"

@interface TableViewCell : UITableViewCell
@property (nonatomic ,strong)HotModel *model;
@property (nonatomic ,strong)TableViewModel *tableModel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *comment;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *rating;



@property (weak, nonatomic) IBOutlet UILabel *titale;

@property (weak, nonatomic) IBOutlet UILabel *wantedCount;

@property (weak, nonatomic) IBOutlet UILabel *director;

@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *rDay;
@property (weak, nonatomic) IBOutlet UIImageView *image4;

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




@end
