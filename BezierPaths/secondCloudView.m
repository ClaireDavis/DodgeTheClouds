//
//  secondCloudView.m
//  BezierPaths
//
//  Created by Claire Davis on 11/9/15.
//  Copyright © 2015 Davis. All rights reserved.
//

#import "secondCloudView.h"

@implementation secondCloudView

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
  
  UIBezierPath *cloud = [self cloudCreate];
  shapeLayer.path = cloud.CGPath;
  
  UIColor *ivory = [UIColor colorWithRed:1 green:1 blue:0.941 alpha:1];
  shapeLayer.fillColor = ivory.CGColor;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
  CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
  
  
  return CGPathContainsPoint(shapeLayer.path, NULL, point, false);
}

-(UIBezierPath*)cloudCreate
{
  
  UIBezierPath *cloudTwo = [UIBezierPath bezierPath];
  
  [cloudTwo moveToPoint:CGPointMake(0, 0)];
  [cloudTwo addQuadCurveToPoint:CGPointMake(30, -50) controlPoint:CGPointMake(-20, -50)];
  [cloudTwo addQuadCurveToPoint:CGPointMake(80,-70) controlPoint:CGPointMake(40, -100)];
  [cloudTwo addQuadCurveToPoint:CGPointMake(150, -50) controlPoint:CGPointMake(120, -100)];
  [cloudTwo addQuadCurveToPoint:CGPointMake(190, 0) controlPoint:CGPointMake(200, -50)];
  
  [cloudTwo addQuadCurveToPoint:CGPointMake(150, 50) controlPoint:CGPointMake(200, 40)];
  [cloudTwo addQuadCurveToPoint:CGPointMake(80, 70) controlPoint:CGPointMake(120, 90)];
  [cloudTwo addQuadCurveToPoint:CGPointMake(30, 50) controlPoint:CGPointMake(40, 80)];
  [cloudTwo addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(-20, 50)];
  
  [cloudTwo applyTransform:CGAffineTransformMakeScale(.55, .55)];

  
  return cloudTwo;
  
}


@end
