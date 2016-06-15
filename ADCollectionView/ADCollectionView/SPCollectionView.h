//
//  SPCollectionView.h
//  SPScrollView
//
//  Created by sheng on 16/1/25.
//  Copyright © 2016年 simple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPCollectionViewLayout.h"
#import "SPCollectionViewCell.h"
@interface SPCollectionView : UICollectionView


@property (nonatomic,assign) CGSize cellSize;

+(instancetype)initWithCellSize:(CGSize)size andFrame:(CGRect)frame;
@end
