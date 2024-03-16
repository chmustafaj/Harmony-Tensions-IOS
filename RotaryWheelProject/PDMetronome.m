//
//  PDMetronome.m
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 14/03/2024.
//

#import "PDMetronome.h"

@implementation PDMetronome

//-(void) setBpm: (NSUInteger)bpm{
//    float value = (float) bpm;
//    [PdBase sendFloat:value toReceiver:@"bpm"];
//}
////Modify the subdivision setter
//-(void) setSubdivisions: (NSUInteger) subdiv{
//    float value = (float) subdiv;
//    [PdBase sendFloat:value toReceiver:@"subdivisions"];
//}
//Modify the onOff setter
-(void) setOn:(BOOL)on{
    _on = on;
    [PdBase sendFloat:_on toReceiver:@"onOff"];
    NSLog(@"Setting on as %@", on ? @"YES" : @"NO");
}
-(void) setBpm:(NSUInteger)bpm{
    _bpm = bpm;
    [PdBase sendFloat:_bpm toReceiver:@"bpm"];

}
-(void) setSubdivisions:(NSUInteger)subdivisions{
    _subdivisions = subdivisions;
    [PdBase sendFloat:_subdivisions toReceiver:@"subdivisions"];

}

//-(void) onOff:(BOOL)yesNo{
//    float yn = (float) yesNo;
//    [PdBase sendFloat:yn toReceiver:@"onOff"];
//    NSLog(@"Settingn on ", yesNo);
//}
-(instancetype) initWithBPM: (NSUInteger) bpm andSubdivisions: (NSUInteger) subdivisions{
    void *patch;
    self = [super init];
    if(self){
        //Load the metronome.pd file
        patch = [PdBase openFile:@"metronome.pd" path: [[NSBundle mainBundle]resourcePath]];
        NSLog(@"Initialization sucessful");
        //If the patch doesn't load, throw an alert with an error
        if(!patch){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                           message:@"Patch not found"
                                                          delegate:self cancelButtonTitle:@"0k" otherButtonTitles:nil, nil];
            //Show the alert
            [alert show];
            //Set the bpm and subdivision properties with the arguments passed to the initializer
           
        }
        self.bpm = bpm;
        self.subdivisions = subdivisions;
    }
    return self;

}
- (instancetype) init{
    return [self initWithBPM:60 andSubdivisions:0];
}
@end
