import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../data/user.dart';
import '../data/banneritem.dart';
import '../data/banner.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../data/login_request.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:dio/dio.dart';

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

    final key = 'fsgjernfjwnfjeft';
    final requests = json.encode(loginRequest);


    final iv = 'HmacSHA1';


    final encryptor = Encrypter(Salsa20(key, iv));
    String base64Text = base64.encode(utf8.encode(requests));
    String encText  = encryptor.encrypt(base64Text);


    http.Response response = await http.post(dataURL,headers: headers,body: encText);
    var result = json.decode(response.body);
    print(result);

//    final cryptor = new PlatformStringCryptor();
//    String encrypted = await cryptor.encrypt("111", key);

//    Dio dio = Dio();
//    dio.options.headers = headers;
//    dio.options.baseUrl = "http://api.vico.xin";
//    Response  resopnse = await dio.post("/client/custom/login",data: encryptor.encrypt(requests));
//    print(resopnse.data);
  }
}
