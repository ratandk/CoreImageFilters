//
//  CIFViewController.h
//  SBCoreImageFilter
//
//  Created by Ratan D K on 18/04/12.
//  Copyright (c) 2012 Org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIFViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UISlider *slider1;
@property (retain, nonatomic) IBOutlet UISlider *slider2;
@property (retain, nonatomic) IBOutlet UISlider *slider3;

@property (retain, nonatomic) CIContext *context;
@property (retain, nonatomic) CIImage *beginImage;

- (IBAction)sliderValueChanged:(id)sender;

@end
