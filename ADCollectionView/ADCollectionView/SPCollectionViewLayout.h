//
//  SPCollectionViewLayout.h
//  SPScrollView
//
//  Created by sheng on 16/1/25.
//  Copyright © 2016年 simple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPCollectionViewLayout : UICollectionViewFlowLayout
@property (nonatomic,assign) CGSize cellSize;

@property (nonatomic,assign) UIEdgeInsets cellInset;

-(instancetype)initWithImageSize:(CGSize)size andFrame:(CGRect)frame;
@end
