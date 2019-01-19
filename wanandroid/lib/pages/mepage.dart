import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/login_request.dart';
import 'weixinpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Map<String, String> headers;
  Dio dio;
  void _login(String result) async{

    headers = Map<String, String>();
    headers["CL-app"] = "CLAC";
    headers["CL-app-v"] = "3.0.0";
    headers["CL-app-m"] = "Prod";
    headers["uuid"] = "";
    headers["appKey"] = "";
    headers["source"] = "tyhj";

    dio = Dio();
    dio.options.headers = headers;
    dio.options.baseUrl = "http://api.vico.xin";

    FormData formData = new FormData.from({
      "json":result
    });
    Response  resopnse = await dio.post("/client/custom/login",data: formData);
    //获取cookie
    print(resopnse.headers["set-cookie"]);
    print(resopnse.data);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('cookie', resopnse.headers["set-cookie"].first);

    ///  CMCL_SESSION=9bafe107c528d76fe3a57a176d5a16175548aea8-uid=5147449e-88d9-4261-9641-a87cea67f42a&sid=1a3482a94539d2037df34ae165c4f015318a4461d05ca8fbb7ab374a36b9d53f;

    getBorrot();
  }

  void getBorrot() async {
    String url = '/client/custom/borrow/get';

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cookie = preferences.get('cookie');
    print(cookie);
    print(cookie.split(";")[0]);

    headers["Set-Cookie"] =cookie.split(";")[0];
    dio.options.headers = headers;

    Response  resopnse = await dio.get(url);
    print(resopnse);
  }
}
