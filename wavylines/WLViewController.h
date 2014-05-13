//
//  WLViewController.h
//  wavylines
//
//  Created by HiroyujuFujimoto on 2014/04/27.
//  Copyright (c) 2014 xemem.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLDrawingView;

@interface WLViewController : UIViewController {

    IBOutlet    UIView          *paramView;
    IBOutlet    WLDrawingView   *stageView;

}

- (IBAction)changeCycle:(id)sender;
- (IBAction)changeVibration:(id)sender;
- (IBAction)changeWidth:(id)sender;

@end
