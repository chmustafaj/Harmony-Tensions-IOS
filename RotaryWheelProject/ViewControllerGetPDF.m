//
//  ViewControllerGetPDF.m
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 04/12/2023.
//

#import "ViewControllerGetPDF.h"
#import "HarmonyTensions-Swift.h"     

@interface ViewControllerGetPDF ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewControllerGetPDF

- (IBAction)btnDismiss:(id)sender {
    [self hide];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configView];
}

- (instancetype)init {
    self = [super initWithNibName:@"ViewControllerGetPDF" bundle:nil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)configView {
    self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.backView.alpha = 0;
    self.contentView.alpha = 0;
    self.contentView.layer.cornerRadius = 10;
}

- (void)appear:(UIViewController *)sender {
    [sender presentViewController:self animated:NO completion:^{
        [self show];
    }];
}

- (void)show {
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backView.alpha = 1;
        self.contentView.alpha = 1;
    } completion:nil];
}

- (void)hide {
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backView.alpha = 0;
        self.contentView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
        [self removeFromParentViewController];
    }];
}


@end
