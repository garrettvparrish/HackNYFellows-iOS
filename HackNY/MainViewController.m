//
//  ViewController.m
//  CRMotionViewDemo
//
//  Created by Christian Roman on 06/02/14.
//  Copyright (c) 2014 Christian Roman. All rights reserved.
//

#import "MainViewController.h"
#import "CRMotionView.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "ContentView.h"
#import "UIImage+ImageEffects.h"
#import "MenuView.h"
#import "hnyAppDelegate.h"
#import <Parse/Parse.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)motionViewWithImage:(int)value withXPos:(int)xPos
{
    PFObject *fellow = [[[AppDelegate() getDataSource] objectForKey:@"2014"] objectAtIndex:value];

    PFImageView *contentView = [[PFImageView alloc] initWithImage:[UIImage imageNamed:@"black.png"]];
    contentView.frame = CGRectMake(320*value, 0, 320, self.view.bounds.size.height);
    contentView.clipsToBounds = YES;
    contentView.file = fellow[@"image"];
    contentView.contentMode = UIViewContentModeScaleAspectFill;
    [sv addSubview:contentView];
    [contentView loadInBackground];
    
    ContentView *cview = [[ContentView alloc] initWithFrame:CGRectMake(320*value, 0, 320, self.view.bounds.size.height)];
    cview.clipsToBounds = YES;
    NSLog(@"fellow image %@", [UIImage imageWithData:[fellow[@"image"] getData]]);
    cview.nameLabel.text = (fellow[@"name"])?(fellow[@"name"]):@"";
    cview.textLabel.text = [NSString stringWithFormat:@"Goes to %@\n\n%@%@%@%@%@", (fellow[@"school"])?(fellow[@"school"]):@"", (fellow[@"q1"])?(fellow[@"q1"]):@"",(fellow[@"q2"])?(fellow[@"q2"]):@"",(fellow[@"q3"])?(fellow[@"q3"]):@"",(fellow[@"q4"])?(fellow[@"q4"]):@"", (fellow[@"q5"])?(fellow[@"q5"]):@""];
    [sv addSubview:cview];
    [cview update];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeMenu:) name:@"closeMenu" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataRefreshed:) name:@"dataRefreshed" object:nil];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    currentPos = scrollView.contentOffset.x;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma notifications

- (void)dataRefreshed:(NSNotification *)notif {
    
    [sv removeFromSuperview];
    sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    sv.pagingEnabled = YES;
    [sv setDelegate:self];
    sv.backgroundColor = [UIColor blackColor];
    sv.contentSize = CGSizeMake(320*(int)[[[AppDelegate() getDataSource] objectForKey:@"2014"] count], self.view.bounds.size.height);
    [self.view addSubview:sv];
    
    for (int i = 0; i < [[[AppDelegate() getDataSource] objectForKey:@"2014"] count]; i++) {
        [self motionViewWithImage:i withXPos:320*i];
    }
}

- (void)closeMenu:(NSNotification *)notif {
    [UIView animateWithDuration:0.5 animations:^(void) {
        menu.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [menu.view removeFromSuperview];
        
    }];
}
@end
