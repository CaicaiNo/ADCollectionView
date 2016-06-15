//
//  SPCollectionViewCell.m
//  SPScrollView
//
//  Created by sheng on 16/1/25.
//  Copyright © 2016年 simple. All rights reserved.
//

#import "SPCollectionViewCell.h"

@interface SPCollectionViewCell()

@property (nonatomic,strong) UIImageView *bgImageView;

@property (nonatomic,strong) UIView *BlurredView;
@end
@implementation SPCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        UIView *blurredView = [[UIView alloc]initWithFrame:self.bounds];
        self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.bgImageView.bounds = self.bounds;
        //        self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundColor=[UIColor grayColor];
        [self addSubview:self.bgImageView];
        [self insertSubview:blurredView aboveSubview:self.bgImageView];
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self.bgImageView setImage:image];
}

-(void)setUrl:(NSURL *)url
{
    _url = url;
    //使用网络图片时 利用SDWebimage加载 用下面注释的代码
//    [self.bgImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    [self.bgImageView setImage:[UIImage imageNamed:@"placeholderImage"]];
}
@end