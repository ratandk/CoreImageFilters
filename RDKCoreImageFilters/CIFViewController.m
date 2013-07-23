//
//  ViewController.m
//  SBCoreImageFilter
//
//  Created by Ratan D K on 18/04/12.
//  Copyright (c) 2012 Org. All rights reserved.
//

#import "CIFViewController.h"

@implementation CIFViewController
@synthesize imageView;
@synthesize slider1;
@synthesize slider2;
@synthesize slider3;
@synthesize context;
@synthesize beginImage;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"colorful" ofType:@"jpg"];
    NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
    
    self.beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
    self.context = [CIContext contextWithOptions:nil];
    
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:filePath];
    imageView.frame = CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y, image.size.width, image.size.height);
    imageView.image = image;
    [image release];
    
    //NSArray *filter1 = [CIFilter filterNamesInCategory:@"CICategoryGeometryAdjustment"];
    //NSLog(@"%@", filter1);
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setSlider1:nil];
    [self setSlider2:nil];
    [self setSlider3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // second
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [context release];
    [beginImage release];
    [imageView release];
    [slider1 release];
    [slider2 release];
    [slider3 release];
    [super dealloc];
}


- (IBAction)sliderValueChanged:(id)sender
{
    CIImage *outputImage = beginImage;
    CIFilter * sepiaFilter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues: kCIInputImageKey, outputImage, nil];
    [ sepiaFilter setValue:[NSNumber numberWithFloat:slider1.value] forKey:@"inputIntensity"];
    outputImage = [ sepiaFilter outputImage];
    
    CIFilter *hueFilter = [CIFilter filterWithName:@"CIHueAdjust" keysAndValues: kCIInputImageKey, outputImage, nil];
    [hueFilter setValue:[NSNumber numberWithFloat:slider2.value] forKey:@"inputAngle"];
    outputImage = [hueFilter outputImage];
    
    CIFilter *ttFilter = [CIFilter filterWithName:@"CIStraightenFilter" keysAndValues: kCIInputImageKey, outputImage, nil];
    [ttFilter setValue:[NSNumber numberWithFloat:slider3.value] forKey:@"inputAngle"];
    outputImage = [ttFilter outputImage];
    
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImage = [UIImage imageWithCGImage:cgImage];
    imageView.image = newImage;
    
    CGImageRelease(cgImage);
}

@end
