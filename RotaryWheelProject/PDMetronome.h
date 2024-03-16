//
//  PDMetronome.h
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 14/03/2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PdDispatcher.h"

@interface PDMetronome : NSObject
@property (assign, nonatomic) NSUInteger bpm;
@property (assign, nonatomic) NSUInteger subdivisions;
@property (assign, nonatomic) BOOL on;
-(instancetype) initWithBPM: (NSUInteger) bpm andSubdivisions: (NSUInteger)subdivisions;
//-(void) onOff : (BOOL) yesNo;
//-(void) setBpm: (NSUInteger) bpm;
//-(void) setSubdivisions: (NSUInteger) subdiv;


@end
