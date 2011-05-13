//
//  ModalStatusOverlayViewController.m
//  ModalStatusOverlay
//
//  Created by Ricky Hussmann on 5/6/11.
//  Copyright 2011 LovelyRide. All rights reserved.
//

#import "StatusOverlayViewController.h"
#import "LRStatusView.h"

#define STATUS_TAG 2039

@implementation StatusOverlayViewController
@synthesize _toggleStatusViewButton;
@synthesize _activitySwitch;
@synthesize _widthField;
@synthesize _heightFied;
@synthesize _statusText;

@synthesize _isEditingTextField;
@synthesize _activeTextField;

- (BOOL)statusViewPresent {

    return [self.view viewWithTag:STATUS_TAG] != nil;
}

- (void)addStatusViewToViewWithWidth:(CGFloat)statusViewWidth
                              height:(CGFloat)statusViewHeight
                                text:(NSString*)statusText
                  includingIndicator:(BOOL)showIndicator
{

    CGRect containerRect = self.view.bounds;
    CGRect statusViewRect = CGRectMake(containerRect.size.width/2.0 - statusViewWidth/2.0,
                                       containerRect.size.height/2.0 - statusViewHeight/2.0,
                                       statusViewWidth,
                                       statusViewHeight);
    
    LRStatusView *statusView = [[LRStatusView alloc] initWithFrame:statusViewRect
                                                         labelText:statusText
                                                  indicatorVisible:showIndicator];
    statusView.tag = STATUS_TAG;
    [self.view addSubview:statusView];
    [statusView release];
}

- (void) removeStatusViewFromView {

    UIView *statusView = [self.view viewWithTag:STATUS_TAG];
    [statusView removeFromSuperview];
}

#pragma mark - IBAction methods
- (void) addStatusViewWithWidth:(CGFloat)width
                         height:(CGFloat)height
                           text:(NSString*)statusText
             includingIndicator:(BOOL)showIndicator
{
    [self addStatusViewToViewWithWidth:width
                                height:height
                                  text:statusText
                    includingIndicator:showIndicator];
    [self._toggleStatusViewButton setTitle: @"Hide Overlay"
                                  forState:UIControlStateNormal];
    
}
- (IBAction)showLoadingOverlay {

    // Collect values from the UI
    BOOL showIndicator = self._activitySwitch.on;
    CGFloat viewWidth = [self._widthField.text floatValue];
    CGFloat viewHeight = [self._heightFied.text floatValue];
    NSString *statusText = [self._statusText text];
    
    if (![self statusViewPresent]) {
        [self addStatusViewWithWidth:viewWidth
                              height:viewHeight
                                text:statusText
                  includingIndicator:showIndicator];
    } else {
        [self removeStatusViewFromView];
        [self._toggleStatusViewButton setTitle:@"Show Overlay"
                                      forState:UIControlStateNormal];
    }        
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self._toggleStatusViewButton setTitle:@"Show Overlay"
                                  forState:UIControlStateNormal];
    self._isEditingTextField = NO;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIResponder methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    if (self._isEditingTextField) {

        [self._activeTextField resignFirstResponder];
        self._activeTextField = nil;
        self._isEditingTextField = NO;
    }
}

#pragma mark - UITextFieldDelegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self._isEditingTextField = YES;
    self._activeTextField = textField;
}

@end
