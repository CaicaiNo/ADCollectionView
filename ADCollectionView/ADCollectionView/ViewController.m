//
//  ViewController.m
//  SPScrollView
//
//  Created by sheng on 16/1/25.
//  Copyright © 2016年 simple. All rights reserved.
//

#import "ViewController.h"
#import "SPCollectionView.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) SPCollectionView *SPView;

@end

@implementation ViewController
static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    SPCollectionView *SPView = [SPCollectionView initWithCellSize:CGSizeMake(80, 120) andFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    SPView.delegate = self;
    SPView.dataSource = self;
    self.SPView  = SPView;
    [self.view addSubview:self.SPView];
    [self.SPView registerClass:[SPCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}
//在这个方法里面相应点击事件
- (void)chooseScrollView:(id)object
{
    NSLog(@"this is %ld",[object integerValue]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView == self.SPView) {
        NSInteger index = self.SPView.contentOffset.x/self.SPView.cellSize.width;
        [self.SPView setContentOffset:CGPointMake(index*self.SPView.cellSize.width+(index)*10, 0) animated:YES];//这里的10 指的是SPLayout.minimumLineSpacing
        [self performSelector:@selector(chooseScrollView:) withObject:[NSNumber numberWithInteger:index]];
        //        NSLog(@"%f,%ld",scrollView.contentOffset.x,index);
    }
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;//这个个数由你图片数来判定，你需要自己定义一个成员变量 NSArray *array，然后返回array.count;就是这个原理
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //需要获取网络图片时
    //    cell.url = 图片URL
    //    cell.url = nil;
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.item]];
    // Configure the cell
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.SPView setContentOffset:CGPointMake(indexPath.row*self.SPView.cellSize.width+(indexPath.row)*10, 0) animated:YES];//这里的10 指的是SPLayout.minimumLineSpacing
    [self performSelector:@selector(chooseScrollView:) withObject:[NSNumber numberWithInteger:indexPath.row]];
    
}
@end
