//
//  ModalStatusOverlayViewController.h
//  ModalStatusOverlay
//
//  Created by Ricky Hussmann on 5/6/11.
//  Copyright 2011 LovelyRide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusOverlayViewController : UIViewController <UITextFieldDelegate> {

    UIButton *_toggleStatusViewButton;
    UISwitch *_activitySwitch;
    UITextField *_widthField;
    UITextField *_heightFied;
    UITextField *_statusText;

    BOOL _isEditingTextField;
    UITextField *_activeTextField;
}

@property (nonatomic, retain) IBOutlet UIButton *_toggleStatusViewButton;
@property (nonatomic, retain) IBOutlet UISwitch *_activitySwitch;
@property (nonatomic, retain) IBOutlet UITextField *_widthField;
@property (nonatomic, retain) IBOutlet UITextField *_heightFied;
@property (nonatomic, retain) IBOutlet UITextField *_statusText;

@property (nonatomic, assign) BOOL _isEditingTextField;
@property (nonatomic, retain) UITextField *_activeTextField;

- (IBAction)showLoadingOverlay;

@end
