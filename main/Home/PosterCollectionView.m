//
//  PosterCollectionView.m
//  Timer
//
//  Created by sunfeng on 16/2/26.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "PosterCollectionView.h"
#import "postView.h"
#import "AViewCell.h"

@implementation PosterCollectionView

#pragma mark - 覆写初始化方法  1.传入单元格宽度   2.注册单元格
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        //注册单元格
        [self registerClass:[AViewCell class] forCellWithReuseIdentifier:@"cell"];
        //父类中完成
        //self.dataSource = self;
        //self.delegate = self;
        
    }
    
    return self;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    cell.model=self.dataList[indexPath.item];
    return  cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item == self.currentIndex) {
        
        NSLog(@"反转");
        
    } else {
        
        
        NSLog(@"移动");
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.item;
        
    }
    
    
}



@end
