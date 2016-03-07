//
//  YugaoCell.h
//  Timer
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YugaoModel.h"


@interface YugaoCell : UITableViewCell
@property (nonatomic ,retain)YugaoModel *model;

@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic ,copy)NSString *url;
@end
//"id": 54985,
//"movieName": "《捉妖记》国际版预告片 ",
//"coverImg": "http://img31.mtime.cn/mg/2015/07/03/153556.70151592.jpg",
//"movieId": 211794,
//"url": "http://vfx.mtime.cn/Video/2015/07/03/mp4/150703111229148697_480.mp4",
//"videoTitle": "捉妖记 国际版预告片",
//"videoLength": 119,
//"rating": -1,
//"type": [
//         "奇幻",
//         "喜剧"
//"summary": "蚁人要打电话叫复联来帮忙"
