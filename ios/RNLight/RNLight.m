#import "AVFoundation/AVFoundation.h"
#import "RNLight.h"
#import "Light.h"

@implementation RNLight

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(turnLightOn)
{
    Light *light = [[Light alloc] init];
    bool isLightActive = [light isLightActive];
    [light turnLightOn];
    if(!isLightActive){[self onLightTurnedOn];}
}

RCT_EXPORT_METHOD(turnLightOff)
{
    Light *light = [[Light alloc] init];
    bool isLightActive = [light isLightActive];
    [light turnLightOff];
    if(isLightActive){[self onLightTurnedOff];}
}

RCT_EXPORT_METHOD(toggle)
{
    Light *light = [[Light alloc] init];
    bool isLightActive = [light isLightActive];
    [light toggle];
    if (isLightActive) {
        [self onLightTurnedOff];
    }else{
        [self onLightTurnedOn];
    }
}

RCT_EXPORT_METHOD(isLightActive:(RCTResponseSenderBlock)callback)
{
    Light *light = [[Light alloc] init];
    NSArray *isLightActive = [light isLightActive] ? @[@(YES)] : @[@(NO)];
    callback(isLightActive);
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"onLightTurnedOn", @"onLightTurnedOff"];
}

- (void)onLightTurnedOn
{
    [self sendEventWithName:@"onLightTurnedOn" body:@""];
}

- (void)onLightTurnedOff
{
    [self sendEventWithName:@"onLightTurnedOff" body:@""];
}

@end
