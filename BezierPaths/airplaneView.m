//
//  airplaneView.m
//  BezierPaths
//
//  Created by Claire Davis on 11/9/15.
//  Copyright © 2015 Davis. All rights reserved.
//

#import "airplaneView.h"

@implementation airplaneView

+(Class)layerClass
{
  return [CAShapeLayer class];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if(self) {
    [self commonInit];
  }
  return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self) {
    [self commonInit];
  }
  return self;
}

-(void)commonInit
{
  CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
  
  self.backgroundColor = [UIColor clearColor];
  
  UIBezierPath *plane = [self cloudTwoCreate];
  shapeLayer.path = plane.CGPath;
  shapeLayer.strokeColor = [[UIColor blackColor]CGColor];
  
  UIColor *whiteSmoke = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1] ;
  shapeLayer.fillColor = whiteSmoke.CGColor;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
  CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
  
  return CGPathContainsPoint(shapeLayer.path, NULL, point, false);
}

-(UIBezierPath*)cloudTwoCreate
{
  UIBezierPath* bezierPath = [UIBezierPath bezierPath];
  [bezierPath moveToPoint: CGPointMake(110.5, 43.5)];
  [bezierPath addCurveToPoint: CGPointMake(38.5, 50.5) controlPoint1: CGPointMake(57.5, 49.5) controlPoint2: CGPointMake(38.5, 50.5)];
  [bezierPath addLineToPoint: CGPointMake(68.5, 57.5)];
  [bezierPath addLineToPoint: CGPointMake(58.5, 66.5)];
  [bezierPath addLineToPoint: CGPointMake(71.5, 60.5)];
  [bezierPath addLineToPoint: CGPointMake(61.5, 84.5)];
  [bezierPath addLineToPoint: CGPointMake(110.5, 42.5)];
  [bezierPath moveToPoint: CGPointMake(70.5, 59.5)];
  [bezierPath addLineToPoint: CGPointMake(96.5, 48.5)];
  [bezierPath addLineToPoint: CGPointMake(68.5, 57.5)];
  [UIColor.blackColor setStroke];
  bezierPath.lineWidth = 1;
  [bezierPath stroke];
  
  [bezierPath applyTransform:CGAffineTransformMakeTranslation(-40, -42)];
  [bezierPath applyTransform:CGAffineTransformMakeScale(1.3, 1.3)];
  return bezierPath;
}

@end
