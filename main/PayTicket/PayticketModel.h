//
//  PayticketModel.h
//  Timer
//
//  Created by bever on 16/2/29.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseModel.h"

@interface PayticketModel :
BaseModel

@property (nonatomic ,copy)NSString *cinameName,*address;
@property (nonatomic ,strong)NSNumber *minPrice;


@property (nonatomic, copy)NSNumber *ratingFinal,*longitude,*latitude;


@property (nonatomic, copy)NSDictionary *feature;

@end
