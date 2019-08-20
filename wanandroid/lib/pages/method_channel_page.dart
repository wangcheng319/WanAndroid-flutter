import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanandroid/data/login_request.dart';

class MethodChannelDemo extends StatefulWidget {
  @override
  _MethodChannelDemoState createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNativeArguments();
  }

  static const platform = const MethodChannel("samples.flutter.io/test");

  ///调用原生方法实现AES加密
  Future<Null> _getNativeArguments() async {
    LoginRequest loginRequest = LoginRequest();
    loginRequest.phone = "16666666666";
    loginRequest.password = "222222";
    loginRequest.systemVersion = "Android-8.1.0";
    loginRequest.location = "0.00";
    loginRequest.networkType = "123";
    loginRequest.longitude = "4.9E-324";
    loginRequest.latitude = "4.9E-324";
    loginRequest.isEm = false;
    loginRequest.deviceToken = "";
    loginRequest.deviceModel = "google-Android SDK built for x86";

    final requests = json.encode(loginRequest);
    print(requests.toString());

    Map<String, String> map = {"flutter": requests};
    try {
      //在通道上调用此方法，获取原生传递参数
      final String result = await platform.invokeMethod("getNativeArguments", map);
      print("原生返回：" + result);
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MethodChannelDemo"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('MethodChannel'),
        ),
      ),
    );
  }
}
