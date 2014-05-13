//
//  WLDrawingView.h
//  wavylines
//
//  Created by HiroyujuFujimoto on 2014/04/27.
//  Copyright (c) 2014 xemem.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLDrawingView : UIView {
    
    CGPoint anchor;
    CGPoint handle;
    
    CGFloat cycle;
    CGFloat vibe;
    CGFloat lineWidth;
}

@property (nonatomic) CGFloat cycle;
@property (nonatomic) CGFloat vibe;
@property (nonatomic) CGFloat lineWidth;

@end
