//
//  ContentView.m
//  HackNY
//
//  Created by KyleR on 7/26/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView
@synthesize nameLabel;
@synthesize textLabel;
@synthesize imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self start];
    }
    return self;
}

- (void)start {
    
    
    contentScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.bounds.size.height)];
    [contentScroll setDelegate:self];
    contentScroll.contentSize = CGSizeMake(320, self.bounds.size.height*3);
    [self addSubview:contentScroll];
    
    black = [[UIView alloc] initWithFrame:CGRectMake(0, -300, 320, contentScroll.contentSize.height+1000)];
    black.backgroundColor = [UIColor blackColor];
    black.alpha = 0.2;
    [contentScroll addSubview:black];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, self.bounds.size.height)];
    imageView.alpha = 0.0;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:imageView];

    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.bounds.size.height-130, 280, 250)];
    [nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:55]];
    [nameLabel setTextColor:[UIColor whiteColor]];
    nameLabel.numberOfLines = 0;
    [contentScroll addSubview:nameLabel];
    
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.bounds.size.height-60, 280, 1000)];
    [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
    [textLabel setTextColor:[UIColor whiteColor]];
    textLabel.numberOfLines = 0;
    [contentScroll addSubview:textLabel];

    

}

- (void)update {
    [textLabel sizeToFit];
    [nameLabel sizeToFit];
    [contentScroll setContentSize:CGSizeMake(320, textLabel.bounds.size.height+self.bounds.size.height+45)];
    [black setFrame:CGRectMake(0,-300,320, textLabel.bounds.size.height+self.bounds.size.height+1000)];

    [nameLabel setFrame:CGRectMake(20,
                                   (nameLabel.bounds.size.height > 65)?self.bounds.size.height-260:
                                   self.bounds.size.height-230, 280, 250)];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, contentScroll.contentSize.height-60, 290, 0.5f)];
    line.alpha = 0.4;
    line.backgroundColor = [UIColor whiteColor];
    [contentScroll addSubview:line];
    
    UIButton *share = [UIButton buttonWithType:UIButtonTypeCustom];
    [share setTitle:@"Share" forState:UIControlStateNormal];
    [share setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    [share setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [share setFrame:CGRectMake(0, contentScroll.contentSize.height-52, 100, 40)];
    [contentScroll addSubview:share];
    
    UIButton *contact = [UIButton buttonWithType:UIButtonTypeCustom];
    [contact setTitle:@"Contact" forState:UIControlStateNormal];
    [contact setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    [contact setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [contact setFrame:CGRectMake(100, contentScroll.contentSize.height-52, 100, 40)];
    [contentScroll addSubview:contact];
    
    UIButton *github = [UIButton buttonWithType:UIButtonTypeCustom];
    [github setTitle:@"Github" forState:UIControlStateNormal];
    [github setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
    [github setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [github setFrame:CGRectMake(200, contentScroll.contentSize.height-52, 100, 40)];
    [contentScroll addSubview:github];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < self.bounds.size.height) {
        black.alpha = 0.2+(scrollView.contentOffset.y/self.bounds.size.height)/2;
        imageView.alpha = 0.2+(scrollView.contentOffset.y/self.bounds.size.height);
        if (scrollView.contentOffset.y > (self.bounds.size.height/2)) {
            [UIView animateWithDuration:0.3 animations:^(void) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"buttonSetHidden" object:nil];
            }];
        } else {
            [UIView animateWithDuration:0.3 animations:^(void) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"buttonSetVisible" object:nil];
            }];
        }
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
