import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
    Text("首页"),
    Text("项目"),
    Text("公众号"),
    Text("我"),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  ///切换content
  void _onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
