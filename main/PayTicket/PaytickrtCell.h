//
//  PaytickrtCell.h
//  Timer
//
//  Created by bever on 16/2/29.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayticketModel.h"

@interface PaytickrtCell : UITableViewCell
@property (nonatomic ,retain)PayticketModel *payticketModel;
@property (weak, nonatomic) IBOutlet UILabel *cinameName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *minPrice;

@property (weak, nonatomic) IBOutlet UIImageView *has3D;
@property (weak, nonatomic) IBOutlet UIImageView *hasIMAX;
@property (weak, nonatomic) IBOutlet UIImageView *hasVIP;
@property (weak, nonatomic) IBOutlet UIImageView *hasPark;
@property (weak, nonatomic) IBOutlet UIImageView *hasServiceTicket;
@property (weak, nonatomic) IBOutlet UIImageView *hasWifi;



@end
//"cinemaId": 2735,
//"cinameName": "新世纪影城阳光100店",
//"address": "济南市阳光新路阳光100美乐汇购物广场3楼",
//"districtID": 1544,
//"isETicket": false,
//"isTicket": true,
//"ratingFinal": 8.714447,
//"longitude": 116.9825,
//"latitude": 36.63898,
//"baiduLongitude": 116.9893,
//"baiduLatitude": 36.64297,
//"movieCount": 17,
//"showtimeCount": 142,
//"minPrice": 3300,
//"feature": {
//    "has3D": 1,
//    "hasIMAX": 0,
//    "hasVIP": 0,
//    "hasPark": 1,
//    "hasServiceTicket": 1,
//    "hasWifi": 0,
//    "hasLoveseat": 0,
//    "hasFeature4K": 0,
//    "hasFeatureDolby": 0,
//    "hasFeatureHuge": 0,
//    "hasFeature4D": 0