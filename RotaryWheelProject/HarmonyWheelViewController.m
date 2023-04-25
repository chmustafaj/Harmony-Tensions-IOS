//
//  SMViewController.m
//  RotaryWheelProject
//
//  Created by cesarerocchi on 2/10/12.
//  Copyright (c) 2012 studiomagnolia.com. All rights reserved.
//

#import "HarmonyWheelViewController.h"
#import "SMRotaryWheel.h"
//#import "HarmonyTensions-Swift.h"
@interface HarmonyWheelViewController()
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end
@implementation HarmonyWheelViewController
- (IBAction)btnPreviousPressed:(id)sender {
    if(hwNo>1){
        hwNo--;
    }
    _pageControl.currentPage = hwNo-1;
    mask.image =[UIImage imageNamed:[NSMutableString stringWithFormat:@"hw%d", hwNo]];
}

- (IBAction)btnNextPressed:(id)sender {
    if(hwNo<noOfHarmonywheels){
        hwNo++;
    }
    _pageControl.currentPage = hwNo-1;
    mask.image =[UIImage imageNamed:[NSMutableString stringWithFormat:@"hw%d", hwNo]];
    
}
@synthesize  valueLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
int hwNo=1;
int noOfHarmonywheels=4;
NSString *key;
UIImageView *mask;


- (void)viewDidLoad
{

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    key=@"C";

//    valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 750, 120, 30)];
//    valueLabel.textAlignment = UITextAlignmentCenter;
//    valueLabel.backgroundColor = [UIColor whiteColor];
//
//    [self.view addSubview:valueLabel];

    UIImageView *imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    imageHolder.center=CGPointMake(self.view.center.x, self.view.center.y -80);
    UIImage *image = [UIImage imageNamed:@"circle_border.png"];
    imageHolder.image = image;
    // optional:
    // [imageHolder sizeToFit];
    imageHolder.center=CGPointMake(self.view.center.x, self.view.center.y -80);

    [self.view addSubview:imageHolder];

    SMRotaryWheel *wheel = [[SMRotaryWheel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)
                                                    andDelegate:self
                                                   withSections:12 wheelSize: 0.33*self.view.frame.size.width];

    wheel.center = CGPointMake(self.view.center.x, self.view.center.y -80);


    wheel.transform = CGAffineTransformMakeRotation(1.135*M_PI); //rotation in radians
//    wheel.transform = CGAffineTransformMakeRotation(-0.1); //rotation in radians


    [self.view addSubview:wheel];
    mask = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    mask.image =[UIImage imageNamed:[NSMutableString stringWithFormat:@"hw%d", hwNo]];
    mask.center = CGPointMake(self.view.center.x, self.view.center.y - 80
                              );
    [self.view addSubview:mask];

//    UIButton *next = [UIButton buttonWithType:UIButtonTypeSystem];
//        [next setTitle:@"Next" forState:UIControlStateNormal];
//        [next sizeToFit];
//        [self.view addSubview:next];
//    [next addTarget:self action:@selector(nextPressed:)
//      forControlEvents:UIControlEventTouchUpInside];
//    [next setFrame:CGRectMake(self.view.frame.size.width/2 +30, 680, 130, 44)];
//
//    UIButton *prev = [UIButton buttonWithType:UIButtonTypeSystem];
//        [prev setTitle:@"Previous" forState:UIControlStateNormal];
//        [prev sizeToFit];
//        [self.view addSubview:prev];
//    [prev addTarget:self action:@selector(prevPressed:)
//      forControlEvents:UIControlEventTouchUpInside];
//    [prev setFrame:CGRectMake(self.view.frame.size.width/2 -150, 680, 130, 44)];
    
   

    
}
- (void)nextPressed:(UIButton *)next {
  
}
- (void)prevPressed:(UIButton *)prev {
   
}

- (void) wheelDidChangeValue:(NSString *)newValue {

    key=newValue;

}



@end
