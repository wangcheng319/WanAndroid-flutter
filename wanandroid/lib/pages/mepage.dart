import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../data/login_request.dart';
import 'weixinpage.dart';

///我
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    print("4创建");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  static const platform = const MethodChannel("samples.flutter.io/test");

  Future<Null> _getNativeArguments() async {

    LoginRequest loginRequest = LoginRequest();
    loginRequest.phone = "15659926163";
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

    Map<String, String> map = { "flutter": requests};
    try {
      //在通道上调用此方法，获取原生传递参数
      final String result = await platform.invokeMethod("getNativeArguments",map);
      print("原生返回："+result);

      _login(result);

    } on PlatformException catch (e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            loginLayout(),
          ],
        ),
      ),
    );
  }

  Widget loginLayout() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.account_box),
                hintText: "请输入用户名",
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    left: 0, top: 5, bottom: 5, right: 10)),
          ),

//          RaisedButton(onPressed: _login),

          RaisedButton(onPressed: _getNativeArguments),
        ],
      ),
    );
  }

  void _login(String result) async{

    Map<String, String> headers = Map<String, String>();
    headers["CL-app"] = "CLAC";
    headers["CL-app-v"] = "3.0.0";
    headers["CL-app-m"] = "Prod";
    headers["uuid"] = "";
    headers["appKey"] = "";
    headers["source"] = "tyhj";

    Dio dio = Dio();
    dio.options.headers = headers;
    dio.options.baseUrl = "http://api.vico.xin";

    FormData formData = new FormData.from({
      "json":result
    });
    Response  resopnse = await dio.post("/client/custom/login",data: formData);
    print(resopnse.headers);
    print(resopnse.data);
  }
}
