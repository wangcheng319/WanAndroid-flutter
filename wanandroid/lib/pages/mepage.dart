import 'dart:_http';
import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';
import 'package:wanandroid/main.dart';

import '../data/login_request.dart';

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

    Map<String, String> map = { "flutter": "这是来自flutter的参数"};
    try {
      //在通道上调用此方法，获取原生传递参数
      final String result = await platform.invokeMethod("getNativeArguments",map);
      print("原生返回："+result);
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

          RaisedButton(onPressed: _login),

          RaisedButton(onPressed: _getNativeArguments),
        ],
      ),
    );
  }

  void _login() async{

    String dataURL = "http://api.vico.xin/client/custom/login";
    Map<String, String> headers = Map<String, String>();
    headers["CL-app"] = "CLAC";
    headers["CL-app-v"] = "3.0.0";
    headers["CL-app-m"] = "Prod";
    headers["uuid"] = "";
    headers["appKey"] = "";
    headers["source"] = "tyhj";


    LoginRequest loginRequest = LoginRequest();
    loginRequest.phone = "18521038608";
    loginRequest.password = "123456";
    loginRequest.systemVersion = "Android-8.1.0";
    loginRequest.location = "0.00";
    loginRequest.networkType = "123";
    loginRequest.longitude = "4.9E-324";
    loginRequest.latitude = "4.9E-324";
    loginRequest.isEm = false;
    loginRequest.deviceToken = "";
    loginRequest.deviceModel = "google-Android SDK built for x86";

    final key = 'fsgjernfjwnfjeft';
    final requests = json.encode(loginRequest);


    Dio dio = Dio();
    dio.options.headers = headers;
    dio.options.baseUrl = "http://api.vico.xin";

    FormData formData = new FormData.from({
      "json": "51f6b1790743753029b296b160f45b929855b2839524dd3beb1cfa31777d2c10f4b7"
          "f3184ed8ea759da300ef439680b08bb2803f5160edb04a1ddec48696cb9b73ed67cf6fa29"
          "8a3d75ffb7d2c429d07adc0a5f0f6b3a02109a1aac3bf491b4dfb5b2e83d5a536dc409c140"
          "b14c2784309c1ba45bd0be066a03ab348655edaf1a5a95a3e54a16fe08be4e2bbc8ee071f79"
          "c4e464522241f1f109f85484d6e5de5bd986570810d4c15edd2942c3942faa179c62d5523f6"
          "1efaaa7c741bae5530e336ec9b07266a1c0be16a281824ee19d6cb4424c145bd039365e"
          "f3a5bc0aeb388901f57240e4b07220a2093ecce4e539",
    });
    Response  resopnse = await dio.post("/client/custom/login",data: formData);
    print(resopnse.headers);
    print(resopnse.data);

  }
}
