//
//  ViewController.h
//  CRMotionViewDemo
//
//  Created by Christian Roman on 06/02/14.
//  Copyright (c) 2014 Christian Roman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRMotionView.h"
#import "MenuView.h"

@interface ViewController : UIViewController {
    UIScrollView *sv;
    NSDictionary *dictionary;
    NSMutableArray *array;
    NSMutableArray *numbers;
    UIScrollView *contentScroll;
    CRMotionView *motionView;
    float currentPos;
    MenuView *view;
}

@end
