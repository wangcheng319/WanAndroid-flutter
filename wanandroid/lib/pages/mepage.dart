import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../data/user.dart';
import '../data/banneritem.dart';
import '../data/banner.dart';

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
        ],
      ),
    );
  }
}
