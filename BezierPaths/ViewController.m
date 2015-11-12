//
//  ViewController.m
//  BezierPaths
//
//  Created by Claire Davis on 11/2/15.
//  Copyright © 2015 Davis. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import "secondCloudView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (nonatomic, strong) CAShapeLayer *layer;
@property (nonnull,strong) CAGradientLayer *skyBackground;
@property (weak, nonatomic)IBOutlet
UIView *holderView;
@property (weak, nonatomic) IBOutlet CircleView *cloudView2;
@property (nonatomic, strong)NSLayoutConstraint *viewLeadingConstraint;
@property (nonatomic, strong)NSLayoutConstraint *viewTopConstraint;
@property (nonatomic)CGFloat initialViewTopConstraint;
@property (nonatomic  )CGFloat initialViewLeadingConstraint;
@property (nonatomic)CGPoint viewGesturePoint;
@property (nonatomic, strong)UIBezierPath *cloudTwo;
@property (weak, nonatomic) IBOutlet CircleView *cloudView;
@property (nonatomic, strong)NSLayoutConstraint *cloudLeadingConstraint;
@property (nonatomic, strong)NSLayoutConstraint *cloudTopConstraint;
@property (nonatomic, strong)NSLayoutConstraint *cloudEndingLeadingConstraint;
@property (nonatomic, strong)NSLayoutConstraint *cloud2TopConstraint;
@property (nonatomic, strong)NSLayoutConstraint *cloud2LeadingConstraint;
@property (nonatomic, strong)NSLayoutConstraint *cloud2EndingLeadingConstraint;
@property (weak, nonatomic) IBOutlet secondCloudView *cloudView3;
@property (nonatomic, strong)NSLayoutConstraint *cloud3TopConstraint;
@property (nonatomic, strong)NSLayoutConstraint *cloud3LeadingConstraint;
@property (nonatomic, strong)NSLayoutConstraint *cloud3EndingLeadingConstraint;

@property (weak, nonatomic) IBOutlet UILabel *youLoseLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.youLoseLabel.hidden = YES;
  

  UIColor *darkBlue = [UIColor colorWithRed:0.529 green:0.808 blue:0.98 alpha:1];
  UIColor *mediumBlue = [UIColor colorWithRed:0.624 green:0.843 blue:0.984 alpha:1];
  UIColor *lightBlue = [UIColor colorWithRed:0.859 green:0.941 blue:0.992 alpha:1] ;
  
  
  self.skyBackground = [CAGradientLayer layer];
  self.skyBackground.frame = self.view.frame;
  self.skyBackground.colors = [NSArray arrayWithObjects: (id)darkBlue.CGColor, (id)mediumBlue.CGColor, (id)lightBlue.CGColor, nil];
  
//  self.holderView.backgroundColor = [UIColor greenColor];
  
  //change magic numbers to screen width!!!!!
  
  self.cloudLeadingConstraint = [self.cloudView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:200];
  self.cloudLeadingConstraint.active = YES;
  self.cloudTopConstraint = [self.cloudView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100];
  self.cloudTopConstraint.active = YES;
  self.cloudEndingLeadingConstraint = [self.cloudView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:-150];
  self.cloudEndingLeadingConstraint.active = NO;
  [self.cloudView.widthAnchor constraintEqualToConstant:150].active = YES;
  [self.cloudView.heightAnchor constraintEqualToConstant:140].active = YES;
  
  
  self.cloud2LeadingConstraint = [self.cloudView2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:420];
  self.cloud2LeadingConstraint.active = YES;
  self.cloud2TopConstraint = [self.cloudView2.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:255];
  self.cloud2TopConstraint.active = YES;
  self.cloud2EndingLeadingConstraint = [self.cloudView2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:-150];
  self.cloud2EndingLeadingConstraint.active = NO;
  
  self.cloud3LeadingConstraint = [self.cloudView3.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:420];
  self.cloud3LeadingConstraint.active = YES;
  self.cloud3TopConstraint = [self.cloudView3.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:175];
  self.cloud3TopConstraint.active = YES;
  self.cloud3EndingLeadingConstraint = [self.cloudView3.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:-150];
  self.cloud3EndingLeadingConstraint.active = NO;
  
  [self.view.layer insertSublayer:self.skyBackground atIndex:0];
  [self createView];
//  [self cloudTwoCreate];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
-(void)createView
{
  [self.holderView.widthAnchor constraintEqualToConstant:70].active = YES;
  [self.holderView.heightAnchor constraintEqualToConstant:42].active = YES;

  self.viewLeadingConstraint = [self.holderView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50];
  self.viewLeadingConstraint.active = YES;
  self.initialViewLeadingConstraint = self.viewLeadingConstraint.constant;
  
  self.viewTopConstraint = [self.holderView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:300];
  self.viewTopConstraint.active = YES;
  self.initialViewTopConstraint = self.viewTopConstraint.constant;
  
}

- (IBAction)rotation:(UIRotationGestureRecognizer *)sender {
}

- (IBAction)animateTapped:(id)sender {
  
  [UIView animateWithDuration:15 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat animations:^{
    
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

-(UIBezierPath*)cloud
{

  UIBezierPath *cloud = [UIBezierPath bezierPath];
  [cloud moveToPoint:CGPointMake( 100,40)];
  [cloud addQuadCurveToPoint:CGPointMake(190, 80) controlPoint:CGPointMake(170, -20)];
  [cloud addQuadCurveToPoint:CGPointMake(160, 140) controlPoint:CGPointMake(230, 140)];
  [cloud addQuadCurveToPoint:CGPointMake(70, 140) controlPoint:CGPointMake(120, 200)];
  [cloud addQuadCurveToPoint:CGPointMake(50, 60) controlPoint:CGPointMake(0, 120)];
  [cloud addQuadCurveToPoint:CGPointMake(100, 40) controlPoint:CGPointMake(50, 0)];

  
  [cloud closePath];
  
  CAShapeLayer *layer  = [CAShapeLayer layer];
  
  layer.path = cloud.CGPath;
  layer.strokeColor = [UIColor grayColor].CGColor;
  [self.view.layer addSublayer:layer];

  return cloud;
}
- (IBAction)viewPanned:(UIPanGestureRecognizer *)sender {
  CGPoint translation = [sender translationInView:self.view];
  
  self.viewLeadingConstraint.constant = self.initialViewLeadingConstraint + translation.x;
  self.viewTopConstraint.constant = self.initialViewTopConstraint + translation.y;
  self.viewGesturePoint = [sender locationInView:self.view];
  
  NSLog(@"leadingconstraintconstant %f",self.viewLeadingConstraint.constant);
  [self youLose];
  NSLog(@"cgpoint:%f",self.viewGesturePoint.x);
  if (sender.state == UIGestureRecognizerStateEnded) {
    self.initialViewTopConstraint = self.initialViewTopConstraint +translation.y;
    self.initialViewLeadingConstraint = self.initialViewLeadingConstraint + translation.x;
    
  }
}



-(void)youLose
{
  CGFloat planeX = self.holderView.frame.origin.x;
  CGFloat planeY = self.holderView.frame.origin.y;
  CGPoint point = CGPointMake(planeX+70, planeY);
  CGPoint point2 = CGPointMake(planeX+70, planeY);
  
//  CGPoint point = self.holderView.frame.origin;
  NSLog(@"CLOUD: (%f, %f)", self.cloudView.frame.origin.x, self.cloudView.frame.origin.y);
  NSLog(@"SELF: (%f, %f)", self.view.frame.origin.x, self.view.frame.origin.y);
  NSLog(@"POINT1: (%f, %f)", point.x, point.y);
  
    CGRect frame = [[self.cloudView.layer presentationLayer]frame ];
    CGPoint origin = frame.origin;
  
  point.x -= (origin.x - self.view.frame.origin.x);
  point.y -= (origin.y - self.view.frame.origin.y);
  
  
  CGRect cloud2Frame = [[self.cloudView2.layer presentationLayer]frame];
  CGPoint cloud2Origin = cloud2Frame.origin;
  
  point2.x -= (cloud2Origin.x - self.view.frame.origin.x);
  point2.y -= (cloud2Origin.y - self.view.frame.origin.y);
  
  
//  point.x -= (self.cloudView.frame.origin.x - self.view.frame.origin.x);
//  point.y -= (self.cloudView.frame.origin.y - self.view.frame.origin.y);
  NSLog(@"POINT2: (%f, %f)", point.x, point.y);
  NSLog(@"containspoint: %d",[self.cloudView pointInside:point withEvent:nil]);

  
  if ([self.cloudView pointInside:point withEvent:nil] || [self.cloudView2 pointInside:point2 withEvent:nil] ) {
    self.youLoseLabel.hidden  = NO;
  }
    NSLog(@"intersects: %d",CGRectIntersectsRect(self.cloudView.frame, self.holderView.frame));
    NSLog(@"frame: %f",[[self.cloudView.layer presentationLayer]frame].origin.x);
    NSLog(@"----------------");
  
  
}






@end
