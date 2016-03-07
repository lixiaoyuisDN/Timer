//
//  ShaiXuanView.m
//  Timer
//
//  Created by bever on 16/2/29.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "ShaiXuanView.h"

@implementation ShaiXuanView{

    UIView *_view;
    NSMutableArray *_datalist;
    NSMutableArray *_datalist2;
    NSMutableArray *_datalist3;
    UICollectionView *collectionView;
    UIImageView *image;
//    NSMutableArray *_datalist4;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 375, 358)];
        _view.backgroundColor = [UIColor whiteColor];
        
        [self ceateButton];
        [self ceateColloctionView];
    }
    return self;
}

-(void)ceateColloctionView{
    _datalist = [[NSMutableArray alloc] init];
    _datalist = [[NSMutableArray alloc] initWithObjects:@"全部",@"IMAX厅",@"中国巨幕",@"4K放映厅",@"3D厅",@"杜比全景声...",@"情侣座",@"停车场",@"Wi－Fi", nil];
    _datalist2 = [[NSMutableArray alloc] init];
    _datalist2 = [[NSMutableArray alloc] initWithObjects:@"全部",@"美食广场",@"恒隆广场", nil];
    _datalist3 = [[NSMutableArray alloc] init];
    _datalist3 = [[NSMutableArray alloc] initWithObjects:@"全部",@"历下区",@"市中区",@"槐荫区",@"商河区",@"历城区",@"长清区", nil];
    
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    //设置单元格大小
    flow.itemSize = CGSizeMake((kScreen_W-45)/3, 50);
//    flow.backgroundColor = [UIColor whiteColor];
    //设置单元格水平方向最小间隙
    flow.minimumInteritemSpacing = 10;
    
    //设置单元格垂直方向最小间隙
    flow.minimumLineSpacing = 10;
    
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //-------------------第二步：创建collectionView----------------
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, kScreen_W, kScreen_H-20) collectionViewLayout:flow];
    
    //设置代理
    collectionView.delegate = self;
    //设置数据源协议
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, 358)];
    image.image = [UIImage imageNamed:@"bus"];
    image.hidden = YES;
    [collectionView addSubview:image];
    [self addSubview:collectionView];
    
    //--------------------第三步：注册单元格-----------------------
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%@",_datalist);
        return _datalist.count;


}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    //使用注册单元格，必须使用该方法
    UICollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    UILabel *lable = nil;
//    if (!lable) {
        UILabel *lable = [[UILabel alloc] initWithFrame:cell1.bounds];
        [cell1 addSubview:lable];
//    }
    lable.text = _datalist[indexPath.row];
//    NSLog(@"l=%@",lable);
    cell1.backgroundView = lable;
    return cell1;
}



-(void)ceateButton{

    SegmentView *seg = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W-60, 50)];
//    UIImage *image = [UIImage imageNamed:@"pic_ico_wrong"];
    seg.titleArray = @[@"特色",@"商圈",@"地区",@"地铁"];
    seg.backgroundColor = [UIColor blueColor];
    seg.selectedImage = @"icon_slider_min@3x";
    [seg addBlock:^(int index) {
        
        if (index == 0) {
            _datalist = [[NSMutableArray alloc] initWithObjects:@"全部",@"IMAX厅",@"中国巨幕",@"4K放映厅",@"3D厅",@"杜比全景声...",@"情侣座",@"停车场",@"Wi－Fi", nil];
            image.hidden = YES;
            
        }else if(index == 1){
            _datalist = _datalist2;
            image.hidden = YES;
        }else if(index == 2){
            image.hidden = YES;
            _datalist = _datalist3;
        
        }else if(index == 3){
            
            image.hidden = NO;
            
        
        }
        [collectionView reloadData];
        
        
    }];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_W-60, 0, 60, 50)];
//    button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pic_ico_wrong"]];
    [button setImage:[UIImage imageNamed:@"pic_ico_wrong"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(actionButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [self addSubview:seg];
    
}

-(void)actionButton{

    [UIView animateWithDuration:0.3 animations:^(){
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self cache:YES];
        self.hidden = YES;
        
    }];


}



@end
