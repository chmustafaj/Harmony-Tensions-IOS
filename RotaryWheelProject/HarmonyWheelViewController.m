//
//  SMViewController.m
//  RotaryWheelProject
//
//  Created by cesarerocchi on 2/10/12.
//  Copyright (c) 2012 studiomagnolia.com. All rights reserved.
//

#import "HarmonyWheelViewController.h"
#import "SMRotaryWheel.h"
//#import "ViewControllerBuyPDF.h"
#import "HarmonyTensions-Swift.h"

@interface HarmonyWheelViewController()
@property (weak, nonatomic) IBOutlet UIButton *btnEbook;
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
- (IBAction)btnEbookPressed:(id)sender {
    DataManager *dataManager = [DataManager shared];
    if([NSNumber numberWithBool:[dataManager getPremiumStatus]]>0){
        NSURL *url = [NSURL URLWithString:urlPDF];
        if (url) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }else{
        
        ViewControllerBuyPDF *overLayer = [[ViewControllerBuyPDF alloc] init];
        [overLayer appearWithSender:self];
    }
    
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
bool isPurchased = false;
NSString *urlPDF = @"https://drive.google.com/uc?export=download&id=1giV75QxA5vCztCTMAy957s9D5DcSX9R7";


- (void)viewDidLoad
{

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    key=@"C";
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
                                                   withSections:12 wheelSize: 0.32*self.view.frame.size.width];

    wheel.center = CGPointMake(self.view.center.x, self.view.center.y -80);


    wheel.transform = CGAffineTransformMakeRotation(1.135*M_PI); //rotation in radians


    [self.view addSubview:wheel];
    mask = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    mask.image =[UIImage imageNamed:[NSMutableString stringWithFormat:@"hw%d", hwNo]];
    mask.center = CGPointMake(self.view.center.x, self.view.center.y - 80
                              );
    [self.view addSubview:mask];
    DataManager *dataManager = [DataManager shared];
    if([NSNumber numberWithBool:[dataManager getPremiumStatus]]>0){
        [_btnEbook setTitle:@"View PDF" forState:UIControlStateNormal];
    }else{
        [_btnEbook setTitle:@"Buy PDF" forState:UIControlStateNormal];
    }
    NSLog(@"Premium status: %@", [NSString stringWithFormat:@"%@", [NSNumber numberWithBool:[dataManager getPremiumStatus]]]);



   

    
}

- (void)nextPressed:(UIButton *)next {
  
}
- (void)prevPressed:(UIButton *)prev {
   
}

- (void) wheelDidChangeValue:(NSString *)newValue {

    key=newValue;

}




@end
