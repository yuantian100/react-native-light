#import "AVFoundation/AVFoundation.h"
#import "Light.h"

@implementation Light

- (void) turnLightOn
{
  [self on:true];
}

- (void) turnLightOff
{
  [self on:false];
}

- (bool) isLightActive
{
  if ([AVCaptureDevice class]) {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]){
      return [device isTorchActive];
    }else{
      return false;
    }
  }
  return false;
}

- (void) toggle
{
  bool isLightActive = [self isLightActive];
  if (isLightActive) {
    [self turnLightOff];
  }else{
    [self turnLightOn];
  }
}

- (void) on:(bool) on
{
  if ([AVCaptureDevice class]) {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]){
      [device lockForConfiguration:nil];
      if (on) {
        [device setTorchMode:AVCaptureTorchModeOn];
      } else {
        [device setTorchMode:AVCaptureTorchModeOff];
      }
      [device unlockForConfiguration];
    }
  }
  }

@end
