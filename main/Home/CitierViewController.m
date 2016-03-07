//
//  CitierViewController.m
//  Timer
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "CitierViewController.h"
#import "citiesModel.h"
#import "CitiesCollectionViewCell.h"
#import "CitiesHeaderCollectionReusableView.h"


//#import "CitiesHeaderCollectionReusableView.h"
@interface CitierViewController (){

    __weak IBOutlet UITextField *textFile;

    __weak IBOutlet UICollectionView *_collectionView;
    
    NSMutableDictionary *_citiesDic;//城市字典
    NSMutableArray *_hotCities;//热门城市
    NSMutableArray *_latestCities;//最近访问城市
    NSArray *_dataList;
    NSArray *_dataList1;
}

@end

@implementation CitierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@""]]];
    
    [self loadData];
    //注册单元格
    [_collectionView registerClass:[CitiesCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //注册头视图
    [_collectionView registerClass:[CitiesHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeNovification:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

-(void)changeNovification:(NSNotification *)notification{
    
    NSString *str = textFile.text;
    
    //谓词搜索
    //1.创建谓词条件
    //[C]忽略大小写
    NSString *text = [NSString stringWithFormat:@"SELF like [C] '*%@*' ",str];
    
    
    //2.创建谓词对象
    NSPredicate *predicate = [NSPredicate predicateWithFormat:text];
    
    //3.过滤
    _dataList = [_dataList1 filteredArrayUsingPredicate:predicate];
    
    
    //更新UI(刷新数据)
    [_collectionView reloadData];

}

-(void)loadData{
    _citiesDic = [[NSMutableDictionary alloc] init];
    _hotCities = [[NSMutableArray alloc] init];
    _latestCities = [[NSMutableArray alloc] init];
    
    //读取JSON文件
    NSDictionary *dic = [CoreDateFormJson jsonObjectFromFileName:@"cities"];
    
    NSDictionary *infor = [dic objectForKey:@"infor"];
    
    NSArray *array = [infor objectForKey:@"listItems"];
    
    for (NSDictionary *d in array) {
        
        citiesModel *model = [[citiesModel alloc] init];
        model.name = [d objectForKey:@"name"];
        model.nodepath = [d objectForKey:@"nodepath"];
        model.charindex = [d objectForKey:@"charindex"];
        model.level = [d objectForKey:@"level"];
        model.orderby = [d objectForKey:@"orderby"];
        
        //分组
        //获取一个数组（判断是否为空）
        NSMutableArray *citiesArr = [_citiesDic objectForKey:model.charindex];
        if (citiesArr == nil) {
            //新建一个新的数组，存放刚刚转化的model
            NSMutableArray *newArr = [[NSMutableArray alloc] init];
            
            [newArr addObject:model];
            [_citiesDic setObject:newArr forKey:model.charindex];
            
            
        } else {
            
            //如果在字典中，取到的数组不为空，表示键值对已经存在，直接将model存放在数组中
            [citiesArr addObject:model];
            
            [_citiesDic setObject:citiesArr forKey:model.charindex];
            
        }
        
        //热门城市
        if ([model.level isEqualToString:@"1"]) {
            [_hotCities addObject:model];
            [_citiesDic setObject:_hotCities forKey:@"热门城市"];
            
            
        }
        
        //最近访问
        if ([model.nodepath isEqualToString:@"0"]) {
            [_latestCities addObject:model];
            [_citiesDic setObject:_latestCities forKey:@"最近访问城市"];
        }
        
        
    }
    _dataList = @[@"热门城市",@"最近访问城市",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    
    _dataList1 = _dataList;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return _dataList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *array = [_citiesDic objectForKey:_dataList[section]];
    
    return array.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CitiesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *array = [_citiesDic objectForKey:_dataList[indexPath.section]];
    
    citiesModel *model = array[indexPath.item];
    cell.model = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    //与单元格相似
    CitiesHeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    header.backgroundColor = [UIColor grayColor];
    
    header.type = _dataList[indexPath.section];

    
    
    return header;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [_citiesDic objectForKey:_dataList[indexPath.section]];
    
    citiesModel *model = array[indexPath.item];
    
    
    //    代理调用协议方法
    //    [_delegate bringText:model.name;
    
    //回调block
    _citiesBlock(model.name);
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)setCityName:(CitiesBlock)block{
    _citiesBlock = block;
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
