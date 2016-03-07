//
//  HomeViewController.m
//  Timer
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "postView.h"
#import "CitierViewController.h"




@interface HomeViewController ()

@end

@implementation HomeViewController{

    UITableView *_homeTableView;
    
    NSMutableArray *_dataList;
    
    postView *_view;
    
    }

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"主题";
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    [self createNavigitionBarItem];
    
    [self loadData];
    
    [self createTableView];
}

-(void)loadData{
   
    //读取JSON文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"home_header" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *array = [dic objectForKey:@"movies"];
    _dataList = [[NSMutableArray alloc]init];           
    for (NSDictionary *d in array) {
        HomeModel *model = [[HomeModel alloc] init];
        
        model.titleCn = [d objectForKey:@"titleCn"];
        model.titleEn = [d objectForKey:@"titleEn"];
        model.img = [d objectForKey:@"img"];
        model.ratingFinal = [d objectForKey:@"ratingFinal"];
        model.rYear = [d objectForKey:@"rYear"];
        model.commonSpecial = [d objectForKey:@"commonSpecial"];
        
        [_dataList addObject:model];
    }

    
}

//创建表视图
- (void)createTableView{
    _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    
    _homeTableView.delegate = self;
    _homeTableView.dataSource = self;
    
    
    [self.view addSubview:_homeTableView];
    
    _view = [[postView alloc] initWithFrame:_homeTableView.bounds];
    _view.backgroundColor = [UIColor blueColor];
    _view.hidden = YES;
    _view.datalist = _dataList;
    [self.view addSubview:_view];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:nil options:nil] lastObject];
        
        }
    
    //将model传给cell
    cell.model = _dataList[indexPath.row];
    
    return cell;
}

//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}


-(void)createNavigitionBarItem{
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 60, 25);
    [button1 setTitle:@"北京" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button1];
    
    
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 49, 25)];
    btn1.tag = 101;
    
    [btn1 addTarget:self action:@selector(rightbtnButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 49, 25)];
    btn2.tag = 102;
    
    [btn2 addTarget:self action:@selector(rightbtnButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    btn2.hidden = YES;
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 25)];
    [customView addSubview:btn1];
    [customView addSubview:btn2];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
    



}
#pragma mark - 左面按钮
-(void)leftButtonAction:(UIButton *)btn{
    
    CitierViewController *citieVC = [[CitierViewController alloc] init];
    
    citieVC.title = btn.titleLabel.text;
    
    
    //隐藏标签栏
    citieVC.hidesBottomBarWhenPushed = YES;
    
//    citieVC.delegate = self;
    
    [citieVC setCityName:^(NSString *cityName) {
        
        [btn setTitle:cityName forState:UIControlStateNormal];
    }];
    
    [self.navigationController pushViewController:citieVC animated:YES];
}
#pragma mark - 右面按钮
-(void)rightbtnButton:(UIButton *)btn{
    
    UIView *customView = self.navigationItem.rightBarButtonItem.customView;
   
    btn.hidden = YES;
    
    if (btn.tag == 101) {
        UIButton *btn = [customView viewWithTag:102];
        btn.hidden = NO;
        _view.hidden = NO;
        _homeTableView.hidden = YES;
        
        
//        self.navigationController.navigationBar.alpha = 0.7;
    }else if(btn.tag == 102){
        UIButton *btn =[customView viewWithTag:101];
        btn.hidden = NO;
        _view.hidden = YES;
        _homeTableView.hidden = NO;
       
        //        self.navigationController.navigationBar.alpha = 1;
    }
    //是否调用翻转方法
    [self fanZhuan:customView isLeft:btn.tag == 101? YES:NO];
    [self fanZhuan:self.view isLeft:btn.tag == 101? YES:NO];
    
    
    

}

-(void)fanZhuan:(UIView *)supView isLeft:(BOOL)left{

    [UIView animateWithDuration:0.3 animations:^{
        
        //设置左翻还是右翻
        [UIView setAnimationTransition:left ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight forView:supView cache:YES];
        
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
