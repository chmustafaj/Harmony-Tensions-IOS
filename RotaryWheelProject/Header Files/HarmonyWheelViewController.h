//
//  SMViewController.h
//  RotaryWheelProject
//
//  Created by cesarerocchi on 2/10/12.
//  Copyright (c) 2012 studiomagnolia.com. All rights reserved.


#import <UIKit/UIKit.h>
#import "SMRotaryProtocol.h"

extern NSString *key;

@interface HarmonyWheelViewController : UIViewController<SMRotaryProtocol>

@property (nonatomic, strong) UILabel *valueLabel;


@end
