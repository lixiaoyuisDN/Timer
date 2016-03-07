//
//  YgaoViewController1.m
//  Timer
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "YgaoViewController1.h"



@interface YgaoViewController1 ()

@end

@implementation YgaoViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新闻";
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    NSURL *url = [NSURL URLWithString:@"http://www.iqiyi.com/v_19rrokadb0.html?vfm=2008_aldbd&bvfm=videolocal"];
    NSURL *url = [NSURL URLWithString:_wangzhi];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest: request];
    
    [self.view addSubview:web];
    
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
