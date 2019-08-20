import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:wanandroid/models/order.dart';
import 'package:wanandroid/models/user.dart';
import 'package:wanandroid/pages/align_page.dart';
import 'package:wanandroid/pages/animate_page.dart';
import 'package:wanandroid/pages/dialog_page.dart';
import 'package:wanandroid/pages/event_page.dart';
import 'package:wanandroid/pages/future_builder_page.dart';
import 'package:wanandroid/pages/list_details_page.dart';
import 'package:wanandroid/pages/method_channel_page.dart';
import 'package:wanandroid/pages/privoder_page.dart';
import 'package:wanandroid/pages/projectpage.dart';
import 'package:wanandroid/pages/redux_page.dart';
import 'package:wanandroid/pages/stack_positioned_page.dart';
import 'package:wanandroid/provider/CounterModel.dart';
import 'package:flutter_redux/flutter_redux.dart';
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

//branch -feature111

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
              home: MyHomePage(title: 'Flutter Demo Home Page'),
              routes: <String, WidgetBuilder>{
                //1
                '/list_details': (BuildContext context) => ListDetailsPage(),
                '/future_builder_page': (BuildContext context) => FutureBuilderPage(),
                '/align_page': (BuildContext context) => AlignDemoPage(),
                '/animate_page': (BuildContext context) => AnimateDemoPage(),
                '/stack_positioned_page': (BuildContext context) => StackPositionedPage(),
                '/dialog_page': (BuildContext context) => DialogDemoPage(),
                '/event_page': (BuildContext context) => EventDemoPage(),
                '/provider_page': (BuildContext context) => PrivoderPage(),
                '/redux_page': (BuildContext context) => ReduxDemo(),
                '/method_channel_page': (BuildContext context) => MethodChannelDemo(),
              },
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
//        physics: NeverScrollableScrollPhysics(),//可禁止PageView滑动
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
