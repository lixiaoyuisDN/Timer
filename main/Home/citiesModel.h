//
//  citiesModel.h
//  Timer
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface citiesModel : NSObject

/*
 {
 "id": "1",
 "name": "北京市",
 "parentid": "0",
 "nodepath": "0",
 "namepath": "北京市",
 "charindex": "B",
 "level": "1",
 "orderby": "1"
 }
 */

@property (nonatomic, copy)NSString *name,*nodepath,*charindex,*level,*orderby;


@end
