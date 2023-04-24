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
@end
@implementation HarmonyWheelViewController

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
UILabel *dot1;
UILabel *dot2;
UILabel *dot3;
UILabel *dot4;
- (void) changeDots:(int ) n{
    switch(n){
        case 1:
            [dot1 setTextColor:[UIColor colorWithRed:(80.0/255.f) green:(194.0/255.f) blue:(201.0/255.f) alpha:1]];
            [dot2 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot3 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot4 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            break;
        case 2:
            [dot1 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot2 setTextColor:[UIColor colorWithRed:(80.0/255.f) green:(194.0/255.f) blue:(201.0/255.f) alpha:1]];
            [dot3 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot4 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            break;
        case 3:
            [dot1 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot2 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot3 setTextColor:[UIColor colorWithRed:(80.0/255.f) green:(194.0/255.f) blue:(201.0/255.f) alpha:1]];
            [dot4 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            break;
        case 4:
            [dot1 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot2 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot3 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
            [dot4 setTextColor:[UIColor colorWithRed:(80.0/255.f) green:(194.0/255.f) blue:(201.0/255.f) alpha:1]];
            break;



            
    }
}

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

    UIButton *next = [UIButton buttonWithType:UIButtonTypeSystem];
        [next setTitle:@"Next" forState:UIControlStateNormal];
        [next sizeToFit];
        [self.view addSubview:next];
    [next addTarget:self action:@selector(nextPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [next setFrame:CGRectMake(self.view.frame.size.width/2 +30, 680, 130, 44)];

    UIButton *prev = [UIButton buttonWithType:UIButtonTypeSystem];
        [prev setTitle:@"Previous" forState:UIControlStateNormal];
        [prev sizeToFit];
        [self.view addSubview:prev];
    [prev addTarget:self action:@selector(prevPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [prev setFrame:CGRectMake(self.view.frame.size.width/2 -150, 680, 130, 44)];
    
    dot1 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 -30, 537, 300, 300)];

    [dot1 setTextColor:[UIColor colorWithRed:(80.0/255.f) green:(194.0/255.f) blue:(201.0/255.f) alpha:1]];
    [dot1 setBackgroundColor:[UIColor clearColor]];
    [dot1 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 50.0f]];
    dot1.text=@".";
    [self.view addSubview:dot1];
    
    dot2 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 -10, 537, 300, 300)];
    [dot2 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
    [dot2 setBackgroundColor:[UIColor clearColor]];
    [dot2 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 50.0f]];
    dot2.text=@".";
    [self.view addSubview:dot2];
    
    dot3 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 +10, 537, 300, 300)];
    [dot3 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
    [dot3 setBackgroundColor:[UIColor clearColor]];
    [dot3 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 50.0f]];
    dot3.text=@".";
    [self.view addSubview:dot3];
    
    dot4 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 +30, 537, 300, 300)];
    [dot4 setTextColor:[UIColor colorWithRed:(196.0/255.f) green:(196.0/255.f) blue:(196.0/255.f) alpha:1]];
    [dot4 setBackgroundColor:[UIColor clearColor]];
    [dot4 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 50.0f]];
    dot4.text=@".";
    [self.view addSubview:dot4];
    
    

    
}
- (void)nextPressed:(UIButton *)next {
    if(hwNo<noOfHarmonywheels){
        hwNo++;
    }
    mask.image =[UIImage imageNamed:[NSMutableString stringWithFormat:@"hw%d", hwNo]];
    [self changeDots:hwNo];
    
}
- (void)prevPressed:(UIButton *)prev {
    if(hwNo>1){
        hwNo--;
    }
    mask.image =[UIImage imageNamed:[NSMutableString stringWithFormat:@"hw%d", hwNo]];
    [self changeDots:hwNo];
}

- (void) wheelDidChangeValue:(NSString *)newValue {

    key=newValue;

}



@end
