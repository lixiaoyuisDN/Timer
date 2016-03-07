//
//  DiscoverViewController.m
//  Timer
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "DiscoverViewController.h" 

#import "HotModel.h"
#import "TableViewCell.h"
#import "TableViewModel.h"
#import "ScrollViewCell.h"


@interface DiscoverViewController (){
    UITableView *_tableView1;
    UITableView *_tableView2;
    
    NSMutableArray *_dataList1;
    NSMutableArray *_dataList2;
    NSMutableArray *_datalist3;
    
    NSArray *array;
    NSMutableDictionary *tabledic;
    
    
    
}

@end

@implementation DiscoverViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"优惠";
        self.tabBarItem.image = [UIImage imageNamed:@"discover@3x"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]]];
    
    [self createSegmentView];
    
    [self loadData];
    
    [self createTableView];
}

- (void)createSegmentView{
    
    SegmentView *seg = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, 50)];
    
    seg.titleArray = @[@"正在热映",@"即将上映"];
    seg.delegate = self;
    seg.selectedImage = @"color_line";
    
    [seg addBlock:^(int index) {
        
        //调用移动表视图的代码
        
    }];
    
    [self.view addSubview:seg];
    
}

- (void)loadData{
    _dataList1 = [[NSMutableArray alloc] init];
    _dataList2 = [[NSMutableArray alloc] init];
    _datalist3 = [[NSMutableArray alloc] init];
    NSDictionary *dic = [CoreDateFormJson jsonObjectFromFileName:@"buy_now"];
    NSDictionary *dic2 = [CoreDateFormJson jsonObjectFromFileName:@"buy_new"];
    NSDictionary *dic3 = [CoreDateFormJson jsonObjectFromFileName:@"buy_new"];
    
    NSArray *msArray = [dic objectForKey:@"ms"];
    
    for (NSDictionary *d in msArray) {
        
        HotModel *model = [[HotModel alloc] initWithDic:d];
        
        [_dataList1 addObject:model];
    }
    NSArray *scrollView = [dic3 objectForKey:@"attention"];
    for (NSDictionary *d in scrollView) {
        TableViewModel *model = [[TableViewModel alloc] initWithDic:d];
        
        [_datalist3 addObject:model];
    }
    
    NSArray *tableArray = [dic2 objectForKey:@"moviecomings"];
    tabledic = [[NSMutableDictionary alloc] init];
    array = [[NSArray alloc] init];
    for (NSDictionary *t in tableArray) {
        TableViewModel *tableModel = [[TableViewModel alloc]initWithDic:t];
        
        [_dataList2 addObject:tableModel];
        
        NSMutableArray *array1 = [tabledic objectForKey:tableModel.rMonth];
        if (array1 == nil) {
            NSMutableArray *newArr = [[NSMutableArray alloc] init];
            
            [newArr addObject:tableModel];
            [tabledic setObject:newArr forKey:tableModel.rMonth];
        }else{
        
            [array1 addObject:tableModel];
            
            [tabledic setObject:array1 forKey:tableModel.rMonth];
        
        }
    }
    array = @[@7,@8,@9];
    
}

- (void)createTableView{
    
    //正在热映的表视图
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreen_W, kScreen_H - 64 - 49 - 50) style:UITableViewStylePlain];
    _tableView1.backgroundColor = [UIColor clearColor];
    
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    [self.view addSubview:_tableView1];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(375,50, kScreen_W, kScreen_H - 64-49- 50) style:UITableViewStylePlain];
    _tableView2.backgroundColor = [UIColor clearColor];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
   
    [self.view addSubview:_tableView2];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectZero];
    headerView.backgroundColor = [UIColor grayColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 150, 20)];
    titleLabel.textColor = [UIColor greenColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    titleLabel.text = [NSString stringWithFormat:@"%@月",array[section]];
   
    
    _tableView2.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 160)];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 10, 375, 150)];
    scrollView.contentSize = CGSizeMake(kScreen_W*_datalist3.count, 150);
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    label1.text = @"最受关注";
    label1.font = [UIFont systemFontOfSize:20];
    [_tableView2.tableHeaderView addSubview:label1];
    [_tableView2.tableHeaderView addSubview:scrollView];
    for (int i = 0; i < _datalist3.count; i++) {
        ScrollViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ScrollViewCell" owner:nil options:nil] firstObject];
        cell.frame = CGRectMake(kScreen_W*i, 0, 375, 150);
        cell.tableModel = _datalist3[i];
       [scrollView addSubview:cell];
    }
    
    if (section == 0) {
        UILabel *titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
        titleLabel1.textColor = [UIColor greenColor];
        titleLabel1.font = [UIFont boldSystemFontOfSize:16];
        titleLabel1.text = [NSString stringWithFormat:@"即将上映 (%ld部)",_dataList2.count];
        [headerView addSubview:titleLabel1];
    }

    
    
    
    [headerView addSubview:titleLabel];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (tableView == _tableView1) {
        return 0;
    }
    return 50;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _tableView2) {
        return array.count;
    }

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _tableView2) {
        NSArray *array1 = [tabledic objectForKey:array[section]];
        return array1.count;
    }
    return _dataList1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    TableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    if (cell1 == nil) {
        cell1 = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil] firstObject];
        
    }
    if (cell2 ==nil) {
        cell2 = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil] lastObject];
    }
    
    if (tableView == _tableView1) {
        
         cell1.model = _dataList1[indexPath.row];
    }
   
    
    if (tableView == _tableView2) {
        NSArray *array1 = [tabledic objectForKey:array[indexPath.section]];

        cell2.tableModel = array1[indexPath.row];
        return cell2;
    }
    return cell1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(void)changeTableView:(int)index{
    
    //改变tableView的frame
    [UIView animateWithDuration:.35 animations:^{
        
        _tableView1.frame = CGRectMake(0 - 375 * index , 50, 375, 667);
        _tableView2.frame = CGRectMake(375 - 375 * index,50, 375, 667-64-49-50);
        
        
        
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
