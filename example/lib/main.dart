import 'package:flutter/material.dart';
import 'package:medallia_digital/medallia_digital.dart';
import 'package:medallia_digital_example/MedalliaConstants/medalliaConstant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MedalliaDigital.initializeSDK(MedalliaConstants.sdkToken);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Medallia Digital SDK Functions!'),
              RaisedButton(
                  child: Text("Set Debug Log Level"),
                  onPressed: () {
                    MedalliaDigital.setDebugLogLevel();
                  }),
              RaisedButton(
                  child: Text("ShowForm"),
                  onPressed: () {
                    MedalliaDigital.showForm(MedalliaConstants.alwaysOnFormID);
                  }),
              RaisedButton(
                  child: Text("SetCustomParameter"),
                  onPressed: () {
                    MedalliaDigital.setCustomParameter("TestCP", true);
                  }),
              RaisedButton(
                  child: Text("Disable Intercept"),
                  onPressed: () {
                    MedalliaDigital.disableIntercept();
                  }),
              RaisedButton(
                  child: Text("Enable Intercept"),
                  onPressed: () {
                    MedalliaDigital.enableIntercept();
                  }),
              RaisedButton(
                  child: Text("Handle Notification"),
                  onPressed: () {
                    MedalliaDigital.handleNotification("16685");
                  }),
              RaisedButton(
                  child: Text("Stop SDK"),
                  onPressed: () {
                    MedalliaDigital.stopSDK(false);
                  }),
              RaisedButton(
                  child: Text("Revert Stop SDK"),
                  onPressed: () {
                    MedalliaDigital.revertStopSDK();
                  }),
              RaisedButton(
                  child: Text("Update Locale"),
                  onPressed: () async {
                    String result =
                        await MedalliaDigital.updateCustomLocale("es");
                    print(result);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
