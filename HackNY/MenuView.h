//
//  MenuView.h
//  HackNY
//
//  Created by KyleR on 7/27/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView <UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate> {

}
@property (nonatomic, retain)  UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet UICollectionViewFlowLayout *flowLayout;
@end
