//
//  IndexCollectionView.m
//  Timer
//
//  Created by sunfeng on 16/2/26.
//  Copyright © 2016年 Bever. All rights reserved.
//

#import "IndexCollectionView.h"


@implementation IndexCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //注册单元格
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
        
        //设置宽度
        self.itemWidth = 100;
        
    }
    return self;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"移动");
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    self.currentIndex = indexPath.item;
        


}

@end
