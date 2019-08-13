import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wanandroid/pages/list_details_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  AnimationController _controller;
  Timer _countdownTimer;

  @override
  void initState() {
//    _controller = AnimationController(vsync: this);
    super.initState();
    print("2创建");
  }

  @override
  void dispose() {
//    _controller.dispose();
    _countdownTimer.cancel();
    _countdownTimer = null;
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("项目"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("命名路由-跳转"),
            onPressed: () {
              //命名路由跳转，不能传参,但可以接受返回的参数
              Navigator.pushNamed(context, "/list_details").then((value) {
                //获取返回的参数
                print(value);
              });
            },
          ),
          RaisedButton(
            child: Text("构建路由-跳转"),
            onPressed: () {
              //构建路由，可以传参，可接受返回数据
              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                return new ListDetailsPage(title: "参数1");
              })).then((value) {
                //获取返回的参数
                print(value);
              });
            },
          ),
          RaisedButton(
            child: Text("FutureBuilder"),
            onPressed: () {
              Navigator.pushNamed(context, '/future_builder_page');
            },
          ),
          RaisedButton(
            child: Text("倒计时Timer"),
            onPressed: () {
              _countdown();
            },
          ),
        ],
      ),
    );
  }

  //倒计时
  void _countdown() {
    _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      int time = 10 - timer.tick;
      if (time > 0) {
        print(time);
      } else {
        _countdownTimer.cancel();
        print('重新开始');
      }
    });
  }

  Widget _buildBanner(BuildContext context, int index) {
    return Image.network(
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3239375993,4053990160&fm=27&gp=0.jpg",
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: Colors.yellow,
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("item$index"),
        ),
      ),
      onTap: () {
        print("item$index");
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
