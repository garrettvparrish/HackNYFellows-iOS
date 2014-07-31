//
//  MenuView.m
//  HackNY
//
//  Created by KyleR on 7/27/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView
@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
        [self.view addSubview:imageView];
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    [close setTitle:@"Close" forState:UIControlStateNormal];
    [close.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    [close setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [close setFrame:CGRectMake(15, 10, 70, 40)];
    [close addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:close];


}

- (void)close:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeMenu" object:nil];
}

@end
