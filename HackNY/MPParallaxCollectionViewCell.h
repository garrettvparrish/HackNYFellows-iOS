//
//  MPParallaxCollectionViewCell.h
//  MPPercentDriven
//
//  Created by Alex Manzella on 27/05/14.
//  Copyright (c) 2014 mpow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRMotionView.h"

#define MAX_HORIZONTAL_PARALLAX 70

@class MPParallaxCollectionViewCell;

@protocol MPParallaxCellDelegate <NSObject>

@required

- (void)cell:(MPParallaxCollectionViewCell *)cell changeParallaxValueTo:(CGFloat)value;

@end

@interface MPParallaxCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain) UIImageView *imageView; // from -1 to 1 that represent the minimum form to left to maximim right
@property (nonatomic, retain) NSNumber *index;
- (void)motionViewWithImage;
@property (nonatomic,readwrite) UIImage *image;
@property (nonatomic,assign) CGFloat parallaxValue; // from -1 to 1 that represent the minimum form to left to maximim right
@property (nonatomic,assign) id<MPParallaxCellDelegate>delegate;

@end
