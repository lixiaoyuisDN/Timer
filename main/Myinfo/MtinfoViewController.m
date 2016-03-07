//
//  MtinfoViewController.m
//  Timer
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "MtinfoViewController.h"

@interface MtinfoViewController ()

@end

@implementation MtinfoViewController{

    UITableView *_tableView;
    NSMutableArray *_dataList1;
    NSMutableArray *_dataList2;
    NSArray *_dataList3;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"个人";
        self.tabBarItem.image = [UIImage imageNamed:@"myinfo"];
        [self loadData];
        [self ceateTableView];
        
    }
    return self;
}

-(void)loadData{
    
    _dataList1 = [[NSMutableArray alloc] initWithObjects:@"我去影院看电影",@"我的优惠卷",@"我的电影",@"我的收藏", nil];
    _dataList2 = [[NSMutableArray alloc] initWithObjects:@"设置",@"扫描二维码",@"意见反馈",@"喜欢我们去打分",@"商城使用帮助",nil];
    _dataList3 = @[@"icon_my_cinema@3x ",@"icon_my_coupon@3x ",@"icon_my_movie@3x ",@"icon_my_collection@3x "];

}

-(void)ceateTableView{

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, kScreen_H-64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorColor = [UIColor redColor];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    [self headerTableView];

}

-(void)headerTableView{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
    _tableView.tableHeaderView = view;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 150)];
    view1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_mtime_star.jpg"]];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 110, 110)];
    image.image = [UIImage imageNamed:@"icon_avatar_default_image_55x55@2x"];
    [view1 addSubview:image];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(150, 48, 100, 58)];
    [button1 setTitle:@"登陆" forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"icon_hot_show_buy@3x"] forState:UIControlStateNormal];
    [view1 addSubview:button1];
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(270, 48, 100, 58)];
    [button2 setTitle:@"注册" forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"icon_change_subway@2x"] forState:UIControlStateNormal];
    [view1 addSubview:button2];
    [view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 375, 150)];
    view2.backgroundColor = [UIColor blueColor];
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(40, 20, 75, 75)];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"icon_my_shopping_cart@3x"] forState:UIControlStateNormal];
    [view2 addSubview:btn1];
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 20, 75, 75)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"icon_my_movie_order@3x"] forState:UIControlStateNormal];
    [view2 addSubview:btn2];
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(260, 20, 75, 75)];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"icon_my_goods_order@3x"] forState:UIControlStateNormal];
    [view2 addSubview:btn3];
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(45, 105, 75, 45)];
    lable1.text = @"购物车";
    lable1.font = [UIFont systemFontOfSize:20];
    [view2 addSubview:lable1];
    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 105, 100, 45)];
    lable2.text = @"电影票订单";
    lable2.font = [UIFont systemFontOfSize:20];
    [view2 addSubview:lable2];
    UILabel *lable3 = [[UILabel alloc] initWithFrame:CGRectMake(260, 105, 100, 45)];
    lable3.text = @"商品订单";
    lable3.font = [UIFont systemFontOfSize:20];
    [view2 addSubview:lable3];
    [view addSubview:view2];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return _dataList1.count;
    }
    return _dataList2.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    if (indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:_dataList3[indexPath.row]];
        cell.textLabel.text = _dataList1[indexPath.row];
            }else if(indexPath.section == 1){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = _dataList2[indexPath.row];
    }
    
    return cell;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, 40)];
    view.backgroundColor = [UIColor grayColor];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
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
