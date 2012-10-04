//
//  YTFPlaceholderTableView.m
//  
//
//  Created by Vlad Tsepelev on 21.06.12.
//  Copyright (c) 2012. All rights reserved.
//

#import "YTFPlaceholderTableView.h"
#import <QuartzCore/QuartzCore.h>

@implementation YTFPlaceholderTableView

@synthesize placeholderText;


-(void) initPlaceholderView{    
    placeholderText = [[UILabel alloc] init];
    placeholderText.textAlignment = UITextAlignmentCenter;
    placeholderText.font = [UIFont boldSystemFontOfSize:22];
    placeholderText.textColor = [UIColor blackColor];
    placeholderText.backgroundColor = self.backgroundColor;
    placeholderText.text = NSLocalizedString(@"No items...", @"");
    placeholderText.center = self.center;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initPlaceholderView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initPlaceholderView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPlaceholderView];
    }
    return self;
}

-(void)awakeFromNib{
    [self initPlaceholderView];
}

- (bool) tableViewHasRows
{
    return [self numberOfRowsInSection:0] == 0;
}

- (void) updateEmptyPageAnimated:(BOOL) animated 
{
    if(!self.hidden){
        CGRect rect = self.frame;
        
        if([placeholderText.text sizeWithFont:placeholderText.font].width >= self.frame.size.width){
            placeholderText.transform = CGAffineTransformMakeRotation( -M_PI/2 );
        }else{
            placeholderText.transform = CGAffineTransformIdentity;
        }
        
        rect.origin.y += 20;
        rect.size.height -= 20;
        placeholderText.frame  = rect;
        
        const bool shouldShowEmptyView = self.tableViewHasRows;
        const bool emptyViewShown      = placeholderText.superview != nil;
        
        if (shouldShowEmptyView == emptyViewShown) return;
        
        if (animated) {
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.5];
            [animation setType:kCATransitionFade];
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [[self layer] addAnimation:animation forKey:kCATransitionReveal];
        }else {
            [[self layer] addAnimation:nil forKey:kCATransitionReveal];
        }
        

        
        if (shouldShowEmptyView){
            [self.superview addSubview:placeholderText];
        }
        else{
            [placeholderText removeFromSuperview];
        }
    }
}

#pragma mark UIView

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self updateEmptyPageAnimated:NO];
}

- (UIView*) hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // Prevent any interaction when the empty view is shown
    const bool emptyViewShown = placeholderText.superview != nil;
    return emptyViewShown ? nil : [super hitTest:point withEvent:event];
}

#pragma mark UITableView

- (void) reloadData
{
    [super reloadData];
    [self updateEmptyPageAnimated:NO];
}

- (void)dealloc
{
    [placeholderText release];
    [super dealloc];
}

@end