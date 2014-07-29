//
//  MPParallaxCollectionViewCell.m
//  MPPercentDriven
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import "MPParallaxCollectionViewCell.h"
#import "CRMotionView.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@implementation MPParallaxCollectionViewCell
@synthesize index;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)motionViewWithImage
{
    CRMotionView *motionView = [[CRMotionView alloc] initWithFrame:self.bounds];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld%@",(long)index+1,@".JPG"]]];
    [motionView setContentView:imageView];
    [self addSubview:motionView];
}

- (void)dealloc{
    self.delegate=nil;
}
- (void)setImage:(UIImage *)image{
    self.imageView.image=image;
}

@end
