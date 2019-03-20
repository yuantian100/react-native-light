import { NativeEventEmitter, NativeModules } from 'react-native';

const {RNLight} = NativeModules;

export const lightEventEmitter = new NativeEventEmitter(RNLight);
export const turnLightOn       = RNLight.turnLightOn;
export const turnLightOff      = RNLight.turnLightOff;
export const toggle            = RNLight.toggle;
export const isLightActive     = function () {
  return new Promise((resolve, reject) => {
    RNLight.isLightActive((state) => {
      return resolve(state);
    })
  })
}

export default RNLight;