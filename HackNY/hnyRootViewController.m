//
//  TableViewController.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import "hnyRootViewController.h"
#import "hnyMenuYearCell.h"
#import "hnyAppDelegate.h"
#import "MainViewController.h"

#define kLogoXPosition 160-(250/4)
#define kLogoTopPadding (200/2)-60

@interface hnyRootViewController ()

@end

@implementation hnyRootViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    [self.tableView registerClass:[hnyMenuYearCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorColor = [AppDelegate() hnyMainColor];
    self.view.backgroundColor = [AppDelegate() hnyMainColor];
    [self makePageViewerInBackground];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataRefreshed:) name:@"dataRefreshed" object:nil];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonSetHidden:) name:@"buttonSetHidden" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonSetVisible:) name:@"buttonSetVisible" object:nil];

}

- (void)makePageViewerInBackground {
    [self.tableView setContentOffset:CGPointMake(0, 0)];

    yearMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    yearMenu.contentSize = CGSizeMake(320*2, self.view.bounds.size.height);
    yearMenu.pagingEnabled = YES;
    yearMenu.bounces = NO;
    [yearMenu setDelegate:self];
    [yearMenu setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:yearMenu];
    
    MainViewController *vc = [[MainViewController alloc] init];
    vc.view.frame = CGRectMake(320, 0, 320, self.view.bounds.size.height);
    [yearMenu addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:vc.view.bounds];
    vc.view.layer.masksToBounds = NO;
    vc.view.layer.shadowColor = [UIColor blackColor].CGColor;
    vc.view.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    vc.view.layer.shadowOpacity = 1.0f;
    vc.view.layer.shadowPath = shadowPath.CGPath;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 66, self.view.bounds.size.height)];
    view.userInteractionEnabled = YES;
    [vc.view addSubview:view];
    
    menu = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menu setImage:[UIImage imageNamed:@"menuDark.png"] forState:UIControlStateHighlighted];
    [menu setFrame:CGRectMake(320+25, 20, 30, 30)];
    [menu addTarget:self action:@selector(menu:) forControlEvents:UIControlEventTouchUpInside];
    [yearMenu addSubview:menu];
    
    [self.view sendSubviewToBack:yearMenu];
}

- (void)menu:(id)sender {
    [UIView animateWithDuration:0.5 animations:^(void) {
        [yearMenu setContentOffset:CGPointMake(320,0)];
    } completion:^(BOOL finished) {
        [self.view sendSubviewToBack:yearMenu];
        
    }];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

// Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    logoView.backgroundColor = [AppDelegate() hnyMainColor];
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(kLogoXPosition, kLogoTopPadding, 125, 120)];
    logo.image = [UIImage imageNamed:@"logo.png"];
    [logoView addSubview:logo];

    return logoView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[AppDelegate() arrayOfYears] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView setContentOffset:CGPointMake(0, 0)];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.view bringSubviewToFront:yearMenu];
    [UIView animateWithDuration:0.5 animations:^(void) {
        [yearMenu setContentOffset:CGPointMake(320, 0)];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [[AppDelegate() arrayOfYears] objectAtIndex:indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float value = (320-scrollView.contentOffset.x)/320;
    
    if (value > 0.99) {
        [self.view sendSubviewToBack:yearMenu];
    }
}

- (void)buttonSetHidden:(NSNotification *)notif {
    [UIView animateWithDuration:0.4 animations:^(void) {
        menu.alpha = 0.0;
    }];
}

- (void)buttonSetVisible:(NSNotification *)notif {
    [UIView animateWithDuration:0.4 animations:^(void) {
        menu.alpha = 1.0;
    }];
}

#pragma notification methods 

- (void)dataRefreshed:(NSNotification *)notif {
    [self.tableView reloadData];
}

@end
