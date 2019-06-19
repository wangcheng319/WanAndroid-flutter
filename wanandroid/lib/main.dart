import 'package:flutter/material.dart';

import 'pages/homepage.dart';
import 'pages/mepage.dart';
import 'pages/projectpage.dart';
import 'pages/weixinpage.dart';
import 'pages/tyhj.dart';

import 'data/user.dart';
import 'dart:convert';

void main() => runApp(MyApp());

//branch -feature


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  //用于标记从其他页面返回后需要跳转到第几个tab页
  static const int Main = 333;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*底部导航栏*/
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.android), title: Text("项目")),
    BottomNavigationBarItem(icon: Icon(Icons.book), title: Text("公众号")),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("我")),
  ];

  final List<Widget> _contents = <Widget>[
    HomePage(),
    ProjectPage(),
    WxPage(),
//    MePage(),
    TyhjHomePage(),
  ];

  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PageView(
        children: _contents,
        onPageChanged: _onPageChanged,
        controller: _pageController,
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: _onNavTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blueAccent,
      ),
    );
  }

  ///切换底部导航
  void _onNavTap(int value) {
    setState(() {
      _currentIndex = value;
    });

    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 1), curve: Curves.ease);
  }

  ///切换content
  void _onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
