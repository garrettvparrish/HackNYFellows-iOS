//
//  TableViewCell.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import "TableViewCell.h"
#import "KRStandardStuff.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [KRStandardStuff mainColor];
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        
        [self.textLabel setFrame:CGRectMake(30, 5, 260, 100)];
        [self.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:40.f]];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.textColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
