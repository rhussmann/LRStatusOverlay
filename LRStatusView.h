//
//  LRStatusView.h
//  ModalStatusOverlay
//
//  Created by Ricky Hussmann on 5/6/11.
//  Copyright 2011 LovelyRide. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LRStatusView : UIView {

    UIView *_backgroundView;
    UILabel *_statusLabel;
    UIActivityIndicatorView *_activityIndicator;
}

- (id)initWithFrame:(CGRect)frame labelText:(NSString*)text indicatorVisible:(BOOL)indicatorVisible;

@property (nonatomic, retain) UIView *_backgroundView;
@property (nonatomic, retain) UILabel *_statusLabel;
@property (nonatomic, retain) UIActivityIndicatorView *_activityIndicator;

@end
