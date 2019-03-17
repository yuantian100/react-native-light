#import "AVFoundation/AVFoundation.h"
#import "RNLight.h"
#import "Light.h"

@implementation RNLight

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(turnLightOn)
{
  Light *light = [[Light alloc] init];
  [light turnLightOn];
  [self onLightTurnOn];
}

RCT_EXPORT_METHOD(turnLightOff)
{
  Light *light = [[Light alloc] init];
  [light turnLightOff];
  [self onLightTurnOff];
}

RCT_EXPORT_METHOD(toggle)
{
  Light *light = [[Light alloc] init];
  bool isLightActive = [light isLightActive];
  [light toggle];
  if (isLightActive) {
    [self onLightTurnOff];
  }else{
    [self onLightTurnOn];
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
  return @[@"onLightTurnOn", @"onLightTurnOff"];
}

- (void)onLightTurnOn
{
  [self sendEventWithName:@"onLightTurnOn" body:@""];
}

- (void)onLightTurnOff
{
  [self sendEventWithName:@"onLightTurnOff" body:@""];
}

@end
