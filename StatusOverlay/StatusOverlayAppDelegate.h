//
//  StatusOverlayAppDelegate.h
//  StatusOverlay
//
//  Created by Ricky Hussmann on 5/13/11.
//  Copyright 2011 LovelyRide. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StatusOverlayViewController;

@interface StatusOverlayAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet StatusOverlayViewController *viewController;

@end
