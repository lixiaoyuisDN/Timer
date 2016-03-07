//
//  WuViewController.m
//  Timer
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "WuViewController.h"

@interface WuViewController (){
    UIWebView *_webView;
}

@end

@implementation WuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H -64)];
    //是否调整页面 适应屏幕
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    
    [self.view addSubview:_webView];
    
    [self loadWebViewData];
    
}

-(void)loadWebViewData{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    
    NSString *dataString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSDictionary *dic = [CoreDateFormJson jsonObjectFromFileName:@"newsDetail2"];
    
    NSString *content = [dic objectForKey:@"content"];
    NSString *title = [dic objectForKey:@"title"];
    NSString *time = [dic objectForKey:@"time"];
    NSString *source = [dic objectForKey:@"source"];
    NSString *author = [dic objectForKey:@"author"];
    NSString *editor = [dic objectForKey:@"editor"];
    
    self.title = title;
    
    //字符串拼接，将文件中的%@占位符填充上
    
    NSString *html = [NSString stringWithFormat:dataString,title,author,editor,content,time,source];
    //html文件 用来排版，或者更多的css排版文件
    //json文件用来获取数据，添加到模版中
    [_webView loadHTMLString:html baseURL:nil];

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
