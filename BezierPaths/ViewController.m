//
//  ViewController.m
//  BezierPaths
//
//  Created by Claire Davis on 11/2/15.
//  Copyright © 2015 Davis. All rights reserved.
//

#import "ViewController.h"
#import "firstCloudView.h"
#import "secondCloudView.h"
#import <QuartzCore/QuartzCore.h>
#import "KTOneFingerRotationGestureRecognizer.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) CAShapeLayer *layer;
@property (nonnull,strong) CAGradientLayer *skyBackground;

@property (weak, nonatomic) IBOutlet UIView *holderView;
@property (weak, nonatomic) IBOutlet firstCloudView *cloudView2;

@property (nonatomic, strong) NSLayoutConstraint *viewLeadingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *viewTopConstraint;

@property (nonatomic) CGFloat initialViewTopConstraint;
@property (nonatomic) CGFloat initialViewLeadingConstraint;
@property (nonatomic) CGPoint viewGesturePoint;

@property (nonatomic, strong) UIBezierPath *cloudTwo;

@property (weak, nonatomic) IBOutlet firstCloudView *cloudView;
@property (nonatomic, strong) NSLayoutConstraint *cloudLeadingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cloudTopConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cloudEndingLeadingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cloud2TopConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cloud2LeadingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cloud2EndingLeadingConstraint;
@property (weak, nonatomic) IBOutlet secondCloudView *cloudView3;
@property (nonatomic, strong) NSLayoutConstraint *cloud3TopConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cloud3LeadingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *cloud3EndingLeadingConstraint;

@property (nonatomic, strong) KTOneFingerRotationGestureRecognizer *oneFingerGesture;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (weak, nonatomic) IBOutlet UILabel *youLoseLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.youLoseLabel.hidden = YES;
  
  self.oneFingerGesture.delegate = self;
  self.panGesture.delegate = self;
  
  // background gradient
  UIColor *darkBlue = [UIColor colorWithRed:0.529 green:0.808 blue:0.98 alpha:1];
  UIColor *mediumBlue = [UIColor colorWithRed:0.624 green:0.843 blue:0.984 alpha:1];
  UIColor *lightBlue = [UIColor colorWithRed:0.859 green:0.941 blue:0.992 alpha:1] ;
  
  self.skyBackground = [CAGradientLayer layer];
  self.skyBackground.frame = self.view.frame;
  self.skyBackground.colors = [NSArray arrayWithObjects:(id)darkBlue.CGColor, (id)mediumBlue.CGColor, (id)lightBlue.CGColor, nil];
  
  [self createView];
}

- (void)createView
{
  CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
  CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
  
  // inititalize each cloud's constraints
  self.cloudLeadingConstraint = [self.cloudView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                             constant:screenWidth];
  self.cloudLeadingConstraint.active = YES;
  self.cloudTopConstraint = [self.cloudView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:screenHeight/2];
  self.cloudTopConstraint.active = YES;
  self.cloudEndingLeadingConstraint = [self.cloudView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                                   constant:-150];
  self.cloudEndingLeadingConstraint.active = NO;
  
  self.cloud2LeadingConstraint = [self.cloudView2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                               constant:screenWidth+20];
  self.cloud2LeadingConstraint.active = YES;
  self.cloud2TopConstraint = [self.cloudView2.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:screenHeight/3];
  self.cloud2TopConstraint.active = YES;
  self.cloud2EndingLeadingConstraint = [self.cloudView2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                                     constant:-150];
  self.cloud2EndingLeadingConstraint.active = NO;
  
  self.cloud3LeadingConstraint = [self.cloudView3.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                               constant:screenWidth+30];
  self.cloud3LeadingConstraint.active = YES;
  self.cloud3TopConstraint = [self.cloudView3.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:screenHeight/4];
  self.cloud3TopConstraint.active = YES;
  self.cloud3EndingLeadingConstraint = [self.cloudView3.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                                     constant:-150];
  self.cloud3EndingLeadingConstraint.active = NO;
  
  [self.view.layer insertSublayer:self.skyBackground atIndex:0];
  
  // airplane view
  [self.holderView.widthAnchor constraintEqualToConstant:90].active = YES;
  [self.holderView.heightAnchor constraintEqualToConstant:54].active = YES;
  self.viewLeadingConstraint = [self.holderView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                             constant:screenWidth/3];
  self.viewLeadingConstraint.active = YES;
  self.initialViewLeadingConstraint = self.viewLeadingConstraint.constant;
  
  self.viewTopConstraint = [self.holderView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:screenHeight/2];
  self.viewTopConstraint.active = YES;
  self.initialViewTopConstraint = self.viewTopConstraint.constant;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
  return  YES;
}


- (IBAction)animateTapped:(id)sender
{
  [UIView animateWithDuration:15 delay:0 options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionRepeat) animations:^{
    self.cloudLeadingConstraint.active = !self.cloudLeadingConstraint.active;
    self.cloudEndingLeadingConstraint.active = !self.cloudEndingLeadingConstraint.active;
    [self.view layoutIfNeeded];
  } completion:nil];
  
  [UIView animateWithDuration:10 delay:1 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat animations:^{
    self.cloud2LeadingConstraint.active = !self.cloud2LeadingConstraint.active;
    self.cloud2EndingLeadingConstraint.active = !self.cloud2EndingLeadingConstraint.active;
    [self.view layoutIfNeeded];
  } completion:nil];
  
  [UIView animateWithDuration:12 delay:4 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat animations:^{
    self.cloud3LeadingConstraint.active = !self.cloud3LeadingConstraint.active;
    self.cloud3EndingLeadingConstraint.active = !self.cloud3EndingLeadingConstraint.active;
    [self.view layoutIfNeeded];
  } completion:nil];
}

- (IBAction)viewPanned:(UIPanGestureRecognizer *)sender
{
  CGPoint translation = [sender translationInView:self.view];
  
  self.viewLeadingConstraint.constant = self.initialViewLeadingConstraint + translation.x;
  self.viewTopConstraint.constant = self.initialViewTopConstraint + translation.y;
  self.viewGesturePoint = [sender locationInView:self.view];
  
  if (sender.state == UIGestureRecognizerStateEnded) {
    self.initialViewTopConstraint = self.initialViewTopConstraint +translation.y;
    self.initialViewLeadingConstraint = self.initialViewLeadingConstraint + translation.x;
  }
  
  [self checkIfYouLose];
}

- (void)checkIfYouLose
{
  CGPoint pointToCheck = self.holderView.frame.origin;
  pointToCheck.x += 90.0f;
  if ([self cloudView:self.cloudView containsPoint:pointToCheck] ||
      [self cloudView:self.cloudView2 containsPoint:pointToCheck] ||
      [self cloudView:self.cloudView3 containsPoint:pointToCheck]) {
    self.youLoseLabel.hidden  = NO;
    [self.cloudView.layer.presentationLayer removeAllAnimations];
    [self.cloudView2.layer.presentationLayer removeAllAnimations];
    [self.cloudView3.layer.presentationLayer removeAllAnimations];
  }
}

- (BOOL)cloudView:(UIView *)cloudView containsPoint:(CGPoint)pointInParent
{
  // shift the given point into the cloud's frame of reference, then use point inside
  CGRect cloudFrame = [[cloudView.layer presentationLayer] frame];
  CGPoint cloudOrigin = cloudFrame.origin;
  CGFloat xInCloudFrameOfReference = pointInParent.x - cloudOrigin.x + self.view.frame.origin.x;
  CGFloat yInCloudFrameOfReference = pointInParent.y - cloudOrigin.y + self.view.frame.origin.y;
  return [cloudView pointInside:CGPointMake(xInCloudFrameOfReference, yInCloudFrameOfReference) withEvent:nil];
}

@end
