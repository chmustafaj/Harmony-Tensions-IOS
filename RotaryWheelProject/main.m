//
//  main.m
//  RotaryWheelProject
//
//  Created by cesarerocchi on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SMAppDelegate.h"

int main(int argc, char *argv[])
{
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([SMAppDelegate class]));
//    }
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([SMAppDelegate class]);
    }
        return UIApplicationMain(argc, argv, nil, appDelegateClassName);

}
