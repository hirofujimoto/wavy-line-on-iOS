//
//  WLViewController.m
//  wavylines
//
//  Created by HiroyujuFujimoto on 2014/04/27.
//  Copyright (c) 2014 xemem.com All rights reserved.
//

#import "WLViewController.h"
#import "WLDrawingView.h"

@interface WLViewController ()

@end

@implementation WLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeCycle:(id)sender {
    
    stageView.cycle = ((UISlider *)sender).value;
    [stageView setNeedsDisplay];
}

-(IBAction)changeVibration:(id)sender {
 
    stageView.vibe = ((UISlider *)sender).value;
    [stageView setNeedsDisplay];
}

- (IBAction)changeWidth:(id)sender {
   
    stageView.lineWidth = ((UISlider *)sender).value;
    [stageView setNeedsDisplay];
}

@end
