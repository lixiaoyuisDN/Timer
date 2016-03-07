//
//  CitierViewController.h
//  Timer
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CitiesBlock)(NSString *cityName);

@interface CitierViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{

        CitiesBlock _citiesBlock;
}


- (void)setCityName:(CitiesBlock )block;

@end
