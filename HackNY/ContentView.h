//
//  ContentView.h
//  HackNY
//
//  Created by KyleR on 7/26/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentView : UIView <UIScrollViewDelegate> {
    UIView *black;
    UIScrollView *contentScroll;
    UIButton *menu;
}
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, retain) UIImageView *imageView;
- (void)update;
@end
