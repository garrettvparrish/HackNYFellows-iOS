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

- (void)motionViewWithImage:(int)value withXPos:(int)xPos withPerson:(NSString *)person
{
    motionView = [[CRMotionView alloc]initWithFrame:CGRectMake(xPos, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d%@", value+1, @".JPG"]]];
    [motionView setContentView:imageView];
    [sv addSubview:motionView];
    
    NSError *error;
    NSString *strFileContent = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                                   pathForResource:[NSString stringWithFormat:@"%i", value+1] ofType: @"TXT"] encoding:NSUTF8StringEncoding error:&error];
    
    ContentView *cview = [[ContentView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    [cview.nameLabel setText:person];
    [cview.textLabel setText:strFileContent];
    [motionView addSubview:cview];
    [cview update];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    array = [[NSMutableArray alloc] initWithObjects:@"Calvin Chan", @"Jamis Johnson",@"Lisa Luo", @"Emily Zhang", @"Alex Wheeler", @"Garrett Parrish", @"Catherine Moresco", @"Patrick Facheris", @"Quinn Liu", @"Deepak Kumar", @"Kyle Ryan", @"Matt Condon", @"Walter Menendez", @"Kyle Johnson", @"Shyamal Ruparel", @"Sruti Modekurty", nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeMenu:) name:@"closeMenu" object:nil];
    
    
    sv = [[UIScrollView alloc] initWithFrame:self.view.frame];
    sv.pagingEnabled = YES;
    int numberOfPages = 16;
    [sv setDelegate:self];
    sv.backgroundColor = [UIColor blackColor];
    sv.contentSize = CGSizeMake(320*numberOfPages, self.view.bounds.size.height);
    [self.view addSubview:sv];
	
    for (int i = 0; i < 16; i++) {
        [self motionViewWithImage:i withXPos:320*i withPerson:[array objectAtIndex:i]];
    }
    
}

- (void)closeMenu:(NSNotification *)notif {
    [UIView animateWithDuration:0.5 animations:^(void) {
        menu.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [menu.view removeFromSuperview];
        
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    currentPos = scrollView.contentOffset.x;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
