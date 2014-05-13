//
//  WLDrawingView.m
//  wavylines
//
//  Created by HiroyujuFujimoto on 2014/04/27.
//  Copyright (c) 2014 xemem.com. All rights reserved.
//

#import "WLDrawingView.h"

@implementation WLDrawingView

@synthesize     cycle;
@synthesize     vibe;
@synthesize     lineWidth;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    
    cycle = 10.0;
    vibe = 4.0;
    lineWidth = 2.0;
    
    anchor = CGPointMake(self.frame.size.width * 0.5, self.frame.size.width * 0.5);
    handle = CGPointMake(self.frame.size.width * 0.9, self.frame.size.width * 0.5);
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath    *linePath = [UIBezierPath bezierPath];
    CGRect          clipRect;
    UIBezierPath    *clipPath;
    
    CGFloat         orgX = fminf(anchor.x, handle.x);
    CGFloat         orgY = fminf(anchor.y, handle.y);
    CGFloat         hDir = handle.x - anchor.x;
    CGFloat         width = fabsf(hDir);
    CGFloat         vDir = handle.y - anchor.y;
    CGFloat         height = fabsf(vDir);
    CGRect          lineRect = CGRectMake(orgX, orgY, width, height);
    
    BOOL            diagonal = (hDir * vDir > 0) ? YES:NO;
    CGFloat         radianToRotate = 0.0;
    
    CGFloat         step = cycle * 0.5;
    CGFloat         nextX = rect.origin.x;
    [linePath moveToPoint:CGPointMake(nextX, anchor.y)];
    while (nextX < rect.origin.x + rect.size.width) {
        nextX += cycle;
        [linePath addCurveToPoint:CGPointMake(nextX, anchor.y)
                  controlPoint1:CGPointMake(nextX - step, anchor.y - vibe)
                  controlPoint2:CGPointMake(nextX - step, anchor.y + vibe)];
    }
    if(anchor.y == handle.y){   // horizontal
        clipRect = CGRectInset(lineRect, 0.0, -(rect.size.height));
    }else if(anchor.x == handle.x){ // vertical
        clipRect = CGRectInset(lineRect, -(rect.size.width), 0.0);
        radianToRotate = M_PI_2;
    }else{
        radianToRotate = atan( height / width);

        if(width > height){
            clipRect = CGRectInset(lineRect, 0.0, -(rect.size.height));
        }
        if(height > width){
            clipRect = CGRectInset(lineRect, -(rect.size.width), 0.0);
        }
        if(diagonal == NO){
            radianToRotate = -radianToRotate;
        }
        
    }

    clipPath = [UIBezierPath bezierPathWithRect:clipRect];
    
    if(radianToRotate != 0.0){
        
        [linePath applyTransform:CGAffineTransformMakeTranslation(-(anchor.x), -(anchor.y))];
        [linePath applyTransform:CGAffineTransformMakeRotation(radianToRotate)];
        [linePath applyTransform:CGAffineTransformMakeTranslation(anchor.x, anchor.y)];
    }
    
    [clipPath addClip];
    
    [linePath setLineWidth:lineWidth];   // width
    [[UIColor redColor] setStroke];
    [linePath stroke];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    handle = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  
    UITouch *touch = [touches anyObject];
    handle = [touch locationInView:self];
    [self setNeedsDisplay];

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

@end
