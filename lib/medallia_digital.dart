import 'dart:async';

import 'package:flutter/services.dart';

class MedalliaDigital {
  static const MethodChannel _channel = const MethodChannel('medallia_digital');

  static Future<void> initializeSDK(String token) async {
    final bool result =
        await _channel.invokeMethod("initializeVOCSDK", {"token": token});
    return result;
  }

  ///This API method allows the hosting app to see the SDK logs in the console.
  ///The log level can be set to: off, fatal, error, warn, info, debug.
  static Future<bool> setDebugLogLevel() async {
    final bool result = await _channel.invokeMethod("setDebugLogLevelVOCSDK");
    return result;
  }

  ///Displaying a form on demand, usually a "Feedback" button in app menu.
  ///Takes formID as an argument
  ///Return true for success, false for falure
  static Future<bool> showForm(String formID) async {
    final bool result =
        await _channel.invokeMethod("showFormVOCSDK", {"formID": formID});
    return result;
  }

  ///The SDK enables the app to set custom parameters of several types. Define specific parameter to add to the submitted feedback and targeting. * If the name specified already exists, it will be overridden.
  ///Parameters:
  ///name - custom parameter name
  ///value - custom parameter value
  ///The SDK supports the following types: String, Integer(or int), Long(or long), Double(or double), Float(or float), Boolean(or bool)
  ///In case the value is not one of these primitive types, custom parameter won't be saved.
  ///value can't be null.
  static Future<void> setCustomParameter(String name, dynamic value) async {
    final bool result = await _channel.invokeMethod(
        "setCustomParameterVOCSDK", {"name": name, "value": value});
    return result;
  }

  ///Permits app developers to suppress/disable feedback intercepts (and their respective targeting) from being prompted to the user, usually called in critical flows. This method is always bundled together with enableIntercept() as one method disables the intercept and the other re-enables it.
  ///* This API will not effect showForm API functionality.
  ///For resuming intercept functionality, go to enableIntercept()
  static Future<void> disableIntercept() async {
    final bool result = await _channel.invokeMethod("disableInterceptVOCSDK");
    return result;
  }

  ///Permits app developers to suppress/disable feedback intercepts (and their respective targeting) from being prompted to the user, usually called in critical flows. This method is always bundled together with disableIntercept() as one method disables the intercept and the other re-enables it.
  ///* This API will not effect showForm API functionality.
  ///Customers may consider using this functionality during critical flows such as payment, live support chats, phone calls etc.
  ///Intercept is enabled by default.
  ///When called, these operations store the values in the application memory i.e. the setting remains available as long as the application is alive.
  ///Important note - this API will not affect the showForm functionality
  static Future<void> enableIntercept() async {
    final bool result = await _channel.invokeMethod("enableInterceptVOCSDK");
    return result;
  }

  ///Enables the app to launch forms directly from push notifications. Using this API, forms are properly opened once the pushed notification is selected.
  ///Parameters:
  ///formId - form id to determine which form should be shown.
  ///listener - success or failure in showing a form.
  static Future<bool> handleNotification(String formId) async {
    final bool result = await _channel
        .invokeMethod("handleNotificationVOCSDK", {"formId": formId});
    return result;
  }

  ///Stop SDK API will stop the SDK functionality. In case the API is been called with #clearData parameter true, personalized SDK data will be cleared.
  ///Parameters:
  ///clearData - @boolean - clear data determines if the personalized data should be cleared in addition to stopping the SDK
  static Future<void> stopSDK(bool clearData) async {
    final bool result =
        await _channel.invokeMethod("stopSDKVOCSDK", {"clearData": clearData});
    return result;
  }

  ///Revert Stop SDK API will revive the SDK functionality (if it is stopped). In the next session the SDK functionality will start working as expected.
  static Future<void> revertStopSDK() async {
    final bool result = await _channel.invokeMethod("revertStopSDKVOCSDK");
    return result;
  }

  ///Set custom locale for form multi-language support (if feature is enabled for this property)
  ///Parameters:
  ///locale - @String Custom locale with format of - XX-XX, XX, XX_XX, XX-XXX, XX_XXX, XXX, XXX-XX, XXX_XX, XXX-XXX, XXX_XXX
  ///listener - @MDResultCallback
  static Future<String> updateCustomLocale(String locale) async {
    final String result = await _channel
        .invokeMethod("updateCustomLocaleVOCSDK", {"locale": locale});
    return result;
  }
}
