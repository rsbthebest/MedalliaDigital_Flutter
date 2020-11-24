package com.medallia.digital.sdk.medallia_digital;

import androidx.annotation.NonNull;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.util.Log;

import com.medallia.digital.mobilesdk.MDCallback;
import com.medallia.digital.mobilesdk.MDExternalError;
import com.medallia.digital.mobilesdk.MDLogLevel;
import com.medallia.digital.mobilesdk.MDResultCallback;
import com.medallia.digital.mobilesdk.MedalliaDigital;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;

/** MedalliaDigitalPlugin */
public class MedalliaDigitalPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context mContext;
  private Activity activity;

    @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    mContext = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "medallia_digital");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull final Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("showFormVOCSDK")){
      final String formID = call.argument("formID");
      MedalliaDigital.showForm( formID, new MDResultCallback() {
         @Override
         public void onSuccess() {
           result.success(true);
         }

         @Override
         public void onError(MDExternalError mdExternalError) {
           result.success(false);
         }
       });
    }else if(call.method.equals("setDebugLogLevelVOCSDK")){
      MedalliaDigital.setLogLevel(MDLogLevel.DEBUG);
    }else if(call.method.equals("setCustomParameterVOCSDK")){
      final String name = call.argument("name");
      MedalliaDigital.setCustomParameter(name, call.argument("value"));
    }else if(call.method.equals("disableInterceptVOCSDK")){
      MedalliaDigital.disableIntercept();
    }else if(call.method.equals("enableInterceptVOCSDK")){
      MedalliaDigital.enableIntercept();
    }else if(call.method.equals("handleNotificationVOCSDK")){
      final String formID = call.argument("formId");
      MedalliaDigital.handleNotification(formID, new MDResultCallback() {
           @Override
           public void onSuccess() {
               result.success(true);
           }

           @Override
           public void onError(MDExternalError error) {
               result.success(false);
           }
       });
    }else if(call.method.equals("stopSDKVOCSDK")){
      final Boolean clearData = call.argument("clearData");
      MedalliaDigital.stopSDK(clearData);
    }else if(call.method.equals("revertStopSDKVOCSDK")){
      MedalliaDigital.revertStopSDK();
    }else if(call.method.equals("updateCustomLocaleVOCSDK")){
      final String locale = call.argument("locale");
      MedalliaDigital.updateCustomLocale(locale, new MDCallback() {
          @Override
          public void onSuccess(String message) {
            result.success(message);     
          }

          @Override
          public void onError(MDExternalError error) {
            result.success(error.getMessage());
          }
      });
    }else if(call.method.equals("initializeVOCSDK")){
      final String token = call.argument("token");
      //String token = "eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhcGlUb2tlblYyIiwiYXV0aFVybCI6Imh0dHBzOi8vbW9iaWxlc2RrLWV1LmthbXB5bGUuY29tL2FwaS92MS9hY2Nlc3NUb2tlbiIsImNyZWF0ZVRpbWUiOjE1NDcyMDg4MDU5ODYsImFwaVRva2VuVjJWZXJzaW9uIjoyLCJwcm9wZXJ0eUlkIjoyNTY1MTl9.RBffO-tV_8eN88WDdF_rnI1Pc5lwmE9ouOhbFbieuRiBb0h-MmeKYnwYpX1MTAhJtmHBubBaLSTzF1LgbboNhaeL3AKsZFcN28KkqeDF2ZnQAY1ufAsHq68KnTOea4ZpT_fUGNrvH8o9xiqqKi8WuGwjnc1owpJbTX-NmwWg9lu4ei2qgvEtXAs_aGHxXmJy4oF_xYPcK_8Q-bZYXJcQBNDLpkQaVxwhH7E2ZOVSacyfzijbl_s-DbvH1ACn0gLBVtVeakuuWP4KB6MiHJpCgTtlAbYl1w-CEidMer3rKO3nr3WpOou7mWqj76ZVCxpeWt0OQwTrTcCe3DADCShCRQ";
      MedalliaDigital.setActivity(activity);
        MedalliaDigital.init((Application) mContext, token, new MDResultCallback() {
        @Override
        public void onSuccess() {

        }

        @Override
        public void onError(MDExternalError mdExternalError) {

        }
      });
    }else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onDetachedFromActivity(){
    
  }
  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding){
    
  }
  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding){
    activity = binding.getActivity();
  }
  @Override
  public void onDetachedFromActivityForConfigChanges(){
    
  }
}
