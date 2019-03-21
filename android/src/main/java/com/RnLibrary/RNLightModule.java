package com.RnLibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.react.bridge.Callback;

import android.hardware.Camera;
import android.content.pm.PackageManager;

public class RNLightModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private Camera camera;

    public RNLightModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNLight";
    }

    private boolean isFlashSupported() {
        PackageManager pm = reactContext.getPackageManager();
        return pm.hasSystemFeature(PackageManager.FEATURE_CAMERA_FLASH);
    }

    private boolean isFlashActive() {
        if (camera !=null) {
            return camera.getParameters().getFlashMode().equals(Camera.Parameters.FLASH_MODE_TORCH);
        }
        return false;
    }

    @ReactMethod
    public void isLightActive(Callback successCallback){
        successCallback.invoke(this.isFlashActive());
    }

    @ReactMethod
    public void turnLightOn() {
        if (camera == null) {
            camera = Camera.open();
            Camera.Parameters params = camera.getParameters();
            params.setFlashMode(Camera.Parameters.FLASH_MODE_TORCH);
            camera.setParameters(params);
            camera.startPreview();
            this.sendEvent(reactContext, "onLightTurnedOn" );
        }
    }

    @ReactMethod
    public void turnLightOff() {
        if (camera != null) {
            Camera.Parameters   params = camera.getParameters();
            params.setFlashMode(Camera.Parameters.FLASH_MODE_OFF);
            camera.setParameters(params);
            camera.stopPreview();
            camera.release();
            camera = null;
            this.sendEvent(reactContext, "onLightTurnedOff" );
        }
    }

    @ReactMethod
    public void toggle() {
        if (this.isFlashActive()) {
            this.turnLightOff();
        }else{
            this.turnLightOn();
        }
    }

    private void sendEvent(ReactContext reactContext, String eventName) {
        reactContext
                .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                .emit(eventName, "");
    }

}