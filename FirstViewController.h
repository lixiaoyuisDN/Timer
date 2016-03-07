//
//  FirstViewController.h
//  Timer
//
//  Created by sunfeng on 16/3/4.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)btnAction:(UIButton *)sender;

@end
