//
//  MainViewController.m
//  Timer
//
//  Created by sunfeng on 16/3/4.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "MainViewController.h"
#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "BlockView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [MainViewController creatViewControllers];
}

//创建控制器
//进入主界面
+(void)creatViewControllers{
    
    //创建视图控制器
     NSArray *array = @[@"HomeViewController",@"StoreViewController",@"PayTickViewController",@"DiscoverViewController",@"MtinfoViewController"];
//    NSArray *array = @[@"HomeViewController",@"StoreViewController",@"PayTickViewController",@"DiscoverViewController",@"MtinfoViewController"];
    
    NSMutableArray *navs = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    for (NSString *str in array) {
        
        //创建三级控制器
        UIViewController *viewController = [[NSClassFromString(str) alloc] init];
        
        //创建二级控制器
        baseNavigationController *nav = [[baseNavigationController alloc] initWithRootViewController:viewController];
        
        [navs addObject:nav];
        
    }
    
    BaseTabBarController *baseTabbarController = [[BaseTabBarController alloc] init];
    
    baseTabbarController.viewControllers = navs;
 
    //通过获取appdelegate对象获取window，然后设置window的根视图控制器
    [[UIApplication sharedApplication].delegate window].rootViewController = baseTabbarController;
    
    //进入时，home页面从小放大
    
    //获取home控制器
    HomeViewController *home = baseTabbarController.viewControllers[0];
    
    //修改home控制器的view的transform
    home.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    
    //然后设置动画，从小变大
    [UIView animateWithDuration:1 animations:^{
        home.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        BlockView *alertView = [[BlockView alloc] initWithFrame:CGRectMake(0, 0, 250, 400)];
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:alertView.bounds];
        [alertView addSubview:scrollView];
        for (int i = 1; i < 5; i++) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(alertView.bounds.size.width * (i - 1), 0, alertView.bounds.size.width, alertView.bounds.size.height)];
            imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"wizard%d_568@2x.JPG",i]];
            [scrollView addSubview:imageV];
        }
        scrollView.contentSize = CGSizeMake(alertView.bounds.size.width * 4, alertView.bounds.size.height);
        scrollView.pagingEnabled = YES;
        scrollView.scrollEnabled = YES;
        
        alertView.cancelButtonImage = @"pic_ico_wrong";
        
        [alertView show];
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
