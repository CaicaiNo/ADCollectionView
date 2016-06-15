//
//  SPCollectionViewLayout.m
//  SPScrollView
//
//  Created by sheng on 16/1/25.
//  Copyright © 2016年 simple. All rights reserved.
//

#import "SPCollectionViewLayout.h"
#define TOP (frame.size.height - size.height)/2
#define LEFT (frame.size.width/2 - size.width/2)
@implementation SPCollectionViewLayout

-(instancetype)initWithImageSize:(CGSize)size andFrame:(CGRect)frame{
    SPCollectionViewLayout *SPLayout = [[SPCollectionViewLayout alloc]init];
    SPLayout.itemSize = size;
    
    SPLayout.minimumLineSpacing = 10;
    SPLayout.sectionInset = UIEdgeInsetsMake(TOP, LEFT, TOP, LEFT);
    SPLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return SPLayout;
}
/**
 *  是否应该刷新布局
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
//重写layoutAttributesForElementsInRect方法，获取父类的layoutAttribute并修改
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array=[super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect = CGRectZero;
    visibleRect.size = self.collectionView.bounds.size;
    visibleRect.origin = self.collectionView.contentOffset;
    CGFloat blueCenterX=CGRectGetMidX(visibleRect);
    for (UICollectionViewLayoutAttributes *attribute in array) {
        CGFloat redCenterX=attribute.center.x;
        CGFloat distance=ABS(blueCenterX-redCenterX);
        if (distance <= 25) {
            CGFloat zoom=((25-distance)/25)*0.4+1;//修改此项影响放大大小
            attribute.transform3D=CATransform3DMakeScale(zoom, zoom, 1);
            attribute.alpha = 1.f;
        }else{
            attribute.alpha = 0.5f;
        }
        
    }
    return  array;
}
@end
