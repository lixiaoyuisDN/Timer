//
//  NewsTableView.m
//  Timer
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsTableView.h"
#import "NewsViewTable.h"
#import "BVImageView.h"

@interface NewsTableView ()

@end

@implementation NewsTableView{

    NSMutableArray *_distList;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NewsViewTable *viewTable = [[[NSBundle mainBundle] loadNibNamed:@"NewsViewTable" owner:nil options:nil]firstObject];
//    viewTable.frame = CGRectMake(0, 0, 375, 300);
    viewTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_mtime_star.jpg"]];
    self.tableView.tableHeaderView = viewTable;
    self.title = @"中国好桂宝疯狂对决拖拉基";
    
//    _View.data = _distList;

//    _collecTionView.delegate = self;
//    _collecTionView.dataSource = self;
//    [self.collecTionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"imageCell"];
//     self.collecTionView.scrollEnabled = NO;
    [self loadData];
     _hujhuhhj.data = _distList;
}

-(void)loadData{

    NSDictionary *dic = [CoreDateFormJson jsonObjectFromFileName:@"image_news"];
    _distList = [[NSMutableArray alloc] init];
    NSArray *array = [dic objectForKey:@"images"];
    
    for (NSDictionary *d in array) {
        NSArray *imageName = [d objectForKey:@"url1"];
        [_distList addObject:imageName];
    }

}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return _distList.count;
//}
//
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
//    UIImageView *image = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
//    [image sd_setImageWithURL:[NSURL URLWithString:_distList[indexPath.item]]];
//    [cell.contentView addSubview:image];
//    return cell;
//
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
