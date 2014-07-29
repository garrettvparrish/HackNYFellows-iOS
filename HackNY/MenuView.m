//
//  MenuView.m
//  HackNY
//
//  Created by KyleR on 7/27/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "MenuView.h"
#import "customCell.h"

@implementation MenuView
@synthesize imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, self.bounds.size.height)];
        [self addSubview:imageView];
        
        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
        [close setTitle:@"Close" forState:UIControlStateNormal];
        [close setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
        [close setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
        [close setFrame:CGRectMake(15, 10, 70, 40)];
        [close addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:close];
        
        
        // Configure layout
        self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [self.flowLayout setItemSize:CGSizeMake(320/2, 160)];
        [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        self.flowLayout.minimumInteritemSpacing = 0.0f;
        [self.collectionView registerClass:[customCell class] forCellWithReuseIdentifier:@"classCell"];
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 66, 320, self.bounds.size.height-40) collectionViewLayout:self.flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.bounces = YES;
        [self.collectionView setDelegate:self];
        self.collectionView.clipsToBounds = YES;
        self.collectionView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.collectionView];

        
        
    }
    return self;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = (customCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"classCell" forIndexPath:indexPath];

    return cell;
}

- (void)close:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeMenu" object:nil];
}

@end
