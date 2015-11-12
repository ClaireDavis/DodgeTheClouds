//
//  CircleView.m
//  BezierPaths
//
//  Created by Claire Davis on 11/6/15.
//  Copyright © 2015 Davis. All rights reserved.
//

#import "CircleView.h"



@implementation CircleView

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
//  CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;

  self.shapeLayer = (CAShapeLayer *)self.layer;
  self.backgroundColor = [UIColor clearColor];
  
  UIBezierPath *cloud = [self cloudTwoCreate];
  
  self.shapeLayer.path = cloud.CGPath;
  
  UIColor *whiteSmoke = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1];
  
  
  self.shapeLayer.fillColor = whiteSmoke.CGColor;
  
  self.backgroundColor = [UIColor clearColor];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//-(BOOL)pointInside:(CGPoint)point
{
//  CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
  

  return CGPathContainsPoint(self.shapeLayer.path, NULL, point, false);
}

-(UIBezierPath*)cloudTwoCreate
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
  
  [cloudTwo applyTransform:CGAffineTransformMakeTranslation(5, 85)];
  
  [cloudTwo applyTransform:CGAffineTransformMakeScale(.75, .75)];
  return cloudTwo;
 
}

@end
