//
//  PayTickViewController.m
//  Timer
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "PayTickViewController.h"
#import "SegmentView.h"
#import "PayticketModel.h"
#import "PaytickrtCell.h"
#import "ShaiXuanView.h"

@interface PayTickViewController ()

@end

@implementation PayTickViewController{


    NSMutableArray *_dataList;
    UITableView *_table;
    ShaiXuanView *_shaiXuanView;
    

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"购票";
        self.tabBarItem.image = [UIImage imageNamed:@"payticket"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   

    // Do any additional setup after loading the view.
    SegmentView *segView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    segView.titleArray = @[@"全部",@"附近",@"价格",@"筛选"];
    
    
    segView.selectedImage = @"icon_slider_min@2x.png";
#pragma mark - 循环引用
    __weak PayTickViewController *weakVC = self;
    [segView addBlock:^(int index) {
        
        
        PayTickViewController *strongVC = weakVC;
        
        
        [strongVC changeView:index];
//        [self changeView:index];
        
    }];
    
   [self.view addSubview:segView];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cinema_head_bg.png"]];
   
    //数据加载
    [self loadViewPay];
//    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height- 64-50, 375, self.view.frame.size.height- 64-50-49)];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreen_W, kScreen_H-49-50-64) style:UITableViewStylePlain];
    _table.backgroundColor = [UIColor clearColor];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    _shaiXuanView = [[ShaiXuanView alloc] initWithFrame:CGRectMake(0, 200, 375, 358)];
    _shaiXuanView.backgroundColor = [UIColor whiteColor];
    
    [UIView animateWithDuration:0.3 animations:^(){
    
    _shaiXuanView.hidden = YES;
    
    }];
    
    [self.view addSubview:_shaiXuanView];
    
    
}

//block调用，刷新页面，更新数据
- (void)changeView:(int)index{
    
    //按照附近距离排序
    //调用排序方法 [self reloadData1];
#pragma mark - 前三个按钮点击时，底部视图都是隐藏的
    switch (index) {
        case 0:
            [self loadViewPay];
            
            break;
        case 1:
            [self reloadData1];
            break;
        case 2:
            [self reloadData2];
            break;
        case 3:
            [self reloadData3];
            NSLog(@"显示底部视图");
            break;
        default:
            break;
    }
    
    
    
}

-(void)reloadData3{

    [UIView animateWithDuration:1 animations:^(){
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:_shaiXuanView cache:YES];

        _shaiXuanView.hidden = NO;

    }];
    

}

-(void)reloadData1{

#warning - 排序时要注意的是每次排序后要保证数据源数组的数据不变，只是改变顺序，另外要注意刷新表视图
//设置默认位置（自己所在位置）
float currentLocation = 116.00;
//重新排序
for (int i=0; i<_dataList.count; i++) {
    for (int j=i+1; j<_dataList.count; j++) {
        PayticketModel *model1 = _dataList[i];
        PayticketModel *model2 = _dataList[j];
        float x1 = [model1.longitude floatValue]-currentLocation;
        float x2 = [model2.longitude floatValue]-currentLocation;
        if (x1>x2) {
            [_dataList exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
}
    if (_shaiXuanView.hidden == NO) {
        [UIView animateWithDuration:0.3 animations:^(){
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:_shaiXuanView cache:YES];
            _shaiXuanView.hidden = YES;
            
        }];

    }
    
       //刷新表视图
       [_table reloadData];
}

//价格的比较排序
-(void)reloadData2{
    //对数组里的model重新排序
    for (int i = 0; i < _dataList.count; i++) {
        
        for (int j = i + 1; j < _dataList.count; j++) {
            
            PayticketModel *model1 = _dataList[i];
            PayticketModel *model2 = _dataList[j];
            
            float price1 = [model1.minPrice floatValue];
            float price2 = [model2.minPrice floatValue];
            
            if (price1 > price2) {
                
                [_dataList exchangeObjectAtIndex:i withObjectAtIndex:j];
                
            }
            
        }
        
    }
    if (_shaiXuanView.hidden == NO) {
        [UIView animateWithDuration:0.3 animations:^(){
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:_shaiXuanView cache:YES];
            _shaiXuanView.hidden = YES;
            
        }];
        
    }

    //刷新数据
    [_table reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataList.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PaytickrtCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PaytickrtCell" owner:self options:nil] lastObject];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    //将model传给cell
    cell.payticketModel = _dataList[indexPath.row];
    
    return cell;



}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;

}

-(void)loadViewPay{
        
    NSArray *dic = [CoreDateFormJson jsonObjectFromFileName:@"cinema"];
    _dataList = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in dic) {
        PayticketModel *payticketModel = [[PayticketModel alloc] initWithDic:dict];
        [_dataList addObject:payticketModel];
        
        
    }
    
    if (_shaiXuanView.hidden == NO) {
        [UIView animateWithDuration:0.3 animations:^(){
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:_shaiXuanView cache:YES];
            _shaiXuanView.hidden = YES;
            
        }];
        
    }
    //刷新表视图
    [_table reloadData];

}

#pragma mark - 解决单元格复用图片混乱问题
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (UIView *v in cell.contentView.subviews) {
        
        if ([v isKindOfClass:[UIImageView class]]) {
            
            //imageView的transform还原
            v.transform = CGAffineTransformIdentity;
            v.hidden = NO;
            
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
