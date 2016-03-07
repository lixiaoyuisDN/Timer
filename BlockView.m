//
//  BlockView.m
//  MTime
//
//  Created by 孙 峰 on 15/9/25.
//  Copyright (c) 2015年 SunFeng. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView

{
    UIButton *cancelButton;
}
-(id)initWithFrame:(CGRect)frame {
    
    if (self  = [super initWithFrame:frame]) {
        
        [self creatSelfBounce];
        
        [self creatViews];
        
    }
    
    return self;
}

-(void)creatSelfBounce{
    
    [self setBackgroundColor:[UIColor redColor]];
    
    //设置大小
    CGRect frame = self.frame;
    CGSize size = self.frame.size;
    frame.origin = CGPointMake((kScreen_W -size.width)/2, (kScreen_H -size.height)/2);
    
    self.frame = frame;
    
    self.backgroundColor = [UIColor orangeColor];
    
    //设置圆角
    self.layer.cornerRadius = 10;
    self.layer.borderWidth = 3;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
    //添加阴影
    self.layer.shadowColor = [UIColor grayColor].CGColor;
}

- (void)setCancelButtonImage:(NSString *)cancelButtonImage {
    
    _cancelButtonImage = cancelButtonImage;
    
    [cancelButton setImage:[UIImage imageNamed:cancelButtonImage] forState:UIControlStateNormal];
}

-(void)show{
    
    UIWindow *win = [[UIApplication sharedApplication].delegate window];
    
    [win addSubview:self];
    
    self.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    //第一层动画
    [UIView animateWithDuration:.15 animations:^{
        
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        //第二层动画
        [UIView animateWithDuration:.15 animations:^{
            
            self.transform = CGAffineTransformIdentity;
            
        }];
    }];
    
    [self bringSubviewToFront:cancelButton];
}

-(void)creatViews {
    
    //创建cancelButton
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [cancelButton setFrame:CGRectMake(self.frame.size.width -40, 0, 40, 40)];
    
    [cancelButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cancelButton.tag = 100;
    
    [self addSubview:cancelButton];
    
}

-(void)buttonAction:(UIButton *)sender{
    
    [UIView animateWithDuration:.35 animations:^{
        
        //放大后该透明度，然后隐藏
        self.transform = CGAffineTransformMakeScale(5, 5);
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

@end
