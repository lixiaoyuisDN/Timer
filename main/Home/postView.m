//
//  postView.m
//  Timer
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "postView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"

@implementation postView{

    UIImageView *_headerView;
    
    UIImageView *_imageView;
    
    UIView *_view;
    
    PosterCollectionView *_posterCollectionView;
    IndexCollectionView *_indexCollectionView;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadCollectionView];
        
        [self ceatePostView];
        [self createHeaderView];
        [self ceateView];
        [self addObser];

    }
    return self;
}

#pragma mark - createUI
- (void)loadCollectionView{
    _posterCollectionView = [[PosterCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, self.frame.size.height)];
    
    
    _posterCollectionView.itemWidth = 230;
    _posterCollectionView.backgroundColor = [UIColor redColor];
    [self addSubview:_posterCollectionView];
    
}
#pragma mark - Obser
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSNumber *num = [change objectForKey:@"new"];
    
    NSInteger index = [num integerValue];
    //获取最新的indexPath
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if ([keyPath isEqualToString:@"currentIndex"]) {
        
        if ([object isKindOfClass:[PosterCollectionView class]] && _indexCollectionView.currentIndex != index) {
            
            //让小视图滑动
            NSLog(@"small");
            
            [_indexCollectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            //更改currentIndex属性
            _indexCollectionView.currentIndex = index;
            
        } else if ([object isKindOfClass:[IndexCollectionView class]] && _posterCollectionView.currentIndex != index){
            
            
            //让大视图滑动
            NSLog(@"big");
            
            [_posterCollectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            _posterCollectionView.currentIndex = index;
            
        }
        
        
        
        
    }
    
}


//添加观察者
- (void)addObser{
    [_posterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:NULL];
    
    [_indexCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:NULL];
    
    
}

-(void)ceatePostView{
    _view = [[UIView alloc] initWithFrame:self.bounds];
    _view.backgroundColor = [UIColor blackColor];
    _view.alpha = 0.3;
    _view.hidden = YES;
    [self addSubview:_view];
}

-(void)ceateView{

    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 124, 204)];
    _imageView.image = [UIImage imageNamed:@"light"];
    
    [self addSubview:_imageView];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_W - 124, 10, 124, 204)];
    _imageView.image = [UIImage imageNamed:@"light"];
    
    [self addSubview:_imageView];

}

-(void)createHeaderView{

    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -120, kScreen_W, 150)];
    _headerView.userInteractionEnabled = YES;
    
    _headerView.image = [[UIImage imageNamed:@"indexBG_home"] stretchableImageWithLeftCapWidth:0 topCapHeight:5];
    
    [self addSubview:_headerView];
    
    _indexCollectionView = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen_W, 120)];
    
    [_headerView addSubview:_indexCollectionView];
    //创建下拉按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((kScreen_W - 100)/2, 120, 100, 30);
    
    [btn setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(downAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.selected = YES;
    [_headerView addSubview:btn];


}

-(void)downAction:(UIButton *)button{
    if (button.selected) {
       
    
    [UIView animateWithDuration:0.3 animations:^(){
        _headerView.transform = CGAffineTransformMakeTranslation(0, 120);
    }];
      button.transform = CGAffineTransformMakeRotation(M_PI);
        _view.hidden = NO;
    }else{
        [UIView animateWithDuration:0.3 animations:^(){
        _headerView.transform = CGAffineTransformIdentity;
        }];
        button.transform = CGAffineTransformIdentity;
        _view.hidden = YES;
            }
    button.selected = !button.selected;
}
-(void)setDatalist:(NSArray *)datalist{
    _posterCollectionView.dataList = datalist;
    _indexCollectionView.dataList = datalist;
    
    

}
@end
