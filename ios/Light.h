#import <Foundation/Foundation.h>

@interface Light : NSObject
- (void) turnLightOn;
- (void) turnLightOff;
- (void) toggle;
- (bool) isLightActive;
@end
