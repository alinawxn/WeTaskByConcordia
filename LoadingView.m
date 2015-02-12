//
//  LoadingView.m
//  
//
//  Created by Spiros Gerokostas on 2/12/13.
//  Copyright (c) 2013 Spiros Gerokostas. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()
- (void)_setup;
@end

@implementation LoadingView

#pragma mark - Accessors

@synthesize label = _label;
@synthesize activityIndicatorView = _activityIndicatorView;

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self _setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self _setup];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGSize size = CGSizeMake(self.frame.size.width, 20.0f);
    CGSize labelSize = [_label.text sizeWithFont:_label.font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    CGRect labelRect = CGRectMake(30.0f, 0.0f, labelSize.width, labelSize.height);
    
    [_label drawTextInRect:labelRect];
}

#pragma mark - Private Implementation

- (void)_setup
{
    self.backgroundColor = [UIColor whiteColor];
    self.opaque = YES;
    self.contentMode = UIViewContentModeRedraw;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.text = @"LoadingView";
    _label.textColor = [UIColor darkGrayColor];
    _label.shadowColor = [UIColor whiteColor];
    _label.shadowOffset = CGSizeMake(0.0f, 1.0f);
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.hidesWhenStopped = NO;
    [_activityIndicatorView startAnimating];
    [self addSubview:_activityIndicatorView];
}

@end
