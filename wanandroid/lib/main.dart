import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:wanandroid/pages/projectpage.dart';
import 'package:wanandroid/provider/CounterModel.dart';
import 'package:wanandroid/routes/routes.dart';
import 'package:wanandroid/store/app/AppState.dart';
import 'package:wanandroid/store/index.dart';

import 'pages/homepage.dart';
import 'pages/sliver_page.dart';
import 'pages/weixinpage.dart';

void main() {
  final store = createStore();
  print(store);
  runApp(MyApp(store));
}

//branch -feature111  dev 修改+3
//master +1

EventBus eventBus = EventBus();

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: Container(
          //定义全局的Provider
          child: ChangeNotifierProvider.value(
            value: CounterModel(),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(title: 'Flutter'),
              routes: Routes.routes,
              debugShowCheckedModeBanner: false,
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  //用于标记从其他页面返回后需要跳转到第几个tab页
  static const int Main = 333;
  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this._name);
  /*底部导航栏*/
  int _currentIndex = 0;
  String _name = "";

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
//        physics: NeverScrollableScrollPhysics(),//可禁止PageView滑动
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: _onNavTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blueAccent,
      ),
      floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(200),
          ),
          child: Center(
            child: Text(
              _name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )),
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
