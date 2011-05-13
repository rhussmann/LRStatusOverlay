//
//  LRStatusView.m
//  ModalStatusOverlay
//
//  Created by Ricky Hussmann on 5/6/11.
//  Copyright 2011 LovelyRide. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LRStatusView.h"

UIView* createBackgroundViewForFrame(CGRect frame) {

    CGRect bgRect = CGRectMake(0,
                               0,
                               frame.size.width,
                               frame.size.height);
    
    UIView *background = [[[UIView alloc] initWithFrame:bgRect] autorelease];
    background.backgroundColor = [UIColor blackColor];
    background.alpha = 0.2;
    background.layer.cornerRadius = 7;

    return background;
}

UILabel* createStatusLabelWithTextForFrame(NSString *text, CGRect frame) {

    UILabel *statusLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)] autorelease];
    statusLabel.numberOfLines = 0;
    statusLabel.lineBreakMode = UILineBreakModeWordWrap;
    statusLabel.text = text;
    [statusLabel sizeToFit];
    
    CGFloat labelHeight = statusLabel.bounds.size.height;
    CGFloat labelWidth = statusLabel.bounds.size.width;
    
    CGRect labelRect = CGRectMake(frame.size.width/2.0 - labelWidth/2.0,
                                  frame.size.height/2.0 - labelHeight/2.0,
                                  labelWidth,
                                  labelHeight);
    statusLabel.frame = labelRect;
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.textColor = [UIColor whiteColor];
    statusLabel.shadowColor = [UIColor blackColor];
    statusLabel.shadowOffset = CGSizeMake(-1, 1);

    return statusLabel;
}

@implementation LRStatusView
@synthesize _backgroundView;
@synthesize _statusLabel;
@synthesize _activityIndicator;

- (id)initWithFrame:(CGRect)frame labelText:(NSString*)text indicatorVisible:(BOOL)indicatorVisible 
{
    self = [super initWithFrame:frame];
    if (self) {

        self.clipsToBounds = YES;
        self._backgroundView = createBackgroundViewForFrame(frame);
        self._statusLabel = createStatusLabelWithTextForFrame(text, frame);

        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];

        CGPoint statusLabelCenter = self._statusLabel.center;
        CGRect indicatorRect = CGRectMake(statusLabelCenter.x - 20.0/2.0,
                                          statusLabelCenter.y - self._statusLabel.frame.size.height/2.0 - 20,
                                          20,
                                          20);
        indicator.frame = indicatorRect;
        indicator.hidden = NO;
        [indicator startAnimating];
        
        self._activityIndicator = indicator;
        [indicator release];
        
        [self addSubview:self._backgroundView];
        [self addSubview:self._statusLabel];

        if (indicatorVisible) {
            [self addSubview:self._activityIndicator];
        }
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame labelText:@"Label" indicatorVisible:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    self._statusLabel = nil;
    self._activityIndicator = nil;
    [super dealloc];
}

@end
