//
//  SPCollectionView.m
//  SPScrollView
//
//  Created by sheng on 16/1/25.
//  Copyright © 2016年 simple. All rights reserved.
//

#import "SPCollectionView.h"

@interface SPCollectionView ()

@end
@implementation SPCollectionView

+(instancetype)initWithCellSize:(CGSize)size andFrame:(CGRect)frame{
    
    SPCollectionViewLayout *layout = [[SPCollectionViewLayout alloc]initWithImageSize:size andFrame:frame];
    
    SPCollectionView *SPView = [[SPCollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    SPView.frame = frame;
    SPView.cellSize = size;
    SPView.showsVerticalScrollIndicator = NO;
    SPView.showsHorizontalScrollIndicator = NO;
    SPView.userInteractionEnabled = YES;
    return SPView;
}

@end
