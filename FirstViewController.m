//
//  FirstViewController.m
//  Timer
//
//  Created by sunfeng on 16/3/4.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "FirstViewController.h"
#import "MainViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _button.hidden = YES;
    [self loadViews];
}

- (void)loadViews{
    _scrollView.contentSize = CGSizeMake(kScreen_W * 3, kScreen_H);
    
    _scrollView.scrollEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    //循环创建3个imageView并加载图片
    for (int i = 0; i < 3; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"wizard%d_920.jpg",i + 1];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_W * i, 0, kScreen_W, kScreen_H)];
        
        [imageView setImage:[UIImage imageNamed:imageName]];
        
        [_scrollView addSubview:imageView];
        
    }

}

#pragma mark - 判断按钮何时隐藏何时显示
//scrollView结束减速时调用的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //根据scrollView的偏移量计算当前第几页
    NSInteger currentPage = scrollView.contentOffset.x / kScreen_W;
    
    if (currentPage == 2) {
        
        _button.hidden = NO;
        
    }else{
        
        _button.hidden =  YES;
    }
}




- (IBAction)btnAction:(UIButton *)sender {
    
    [MainViewController creatViewControllers];
    
}
@end
