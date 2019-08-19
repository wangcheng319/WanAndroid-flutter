import 'dart:ui';

import 'package:flutter/material.dart';

class AnimateDemoPage extends StatefulWidget {
  @override
  _AnimateDemoPageState createState() => _AnimateDemoPageState();
}

class _AnimateDemoPageState extends State<AnimateDemoPage> with TickerProviderStateMixin {
  double _opacity = 1.0;
  Color _color = Colors.red;
  double _height = 100;
  int _count = 0;
  Animation<int> _alpha;
  double value;
  Window _window;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    AnimatedOpacity(
                      opacity: _opacity,
                      duration: Duration(seconds: 3),
                      child: FlutterLogo(
                        size: 40.0,
                      ),
                    ),
                    RaisedButton(
                      child: Text("AnimatedOpacity"),
                      onPressed: _changeOpacity,
                    ),
                    RaisedButton(
                      child: Text("从0-1"),
                      onPressed: _animateToOne,
                    ),
                    Text('${value}')
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      child: FlutterLogo(
                        size: 40.0,
                      ),
                      color: _color,
                      height: _height,
                      curve: Curves.linear,
                    ),
                    RaisedButton(
                      child: Text("AnimatedContainer"),
                      onPressed: _changeAnimatedContainer,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    //组件切换动画
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        //执行缩放动画
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: Text(
                        '$_count',
                        //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                        key: ValueKey<int>(_count),
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                    RaisedButton(
                      child: const Text(
                        '+1',
                      ),
                      onPressed: () {
                        setState(() {
                          _count += 1;
                        });
                      },
                    ),
                    Container(
                        child: InkWell(
                      onTap: () {
                        _toHeroPage();
                      },
                      child: Hero(
                          tag: "photo",
                          child: Image.network(
                            "http://pic1.win4000.com/wallpaper/a/59bb838ac9a22.jpg",
                            width: 100,
                          )),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeOpacity() {
    setState(() => _opacity = _opacity == 0 ? 1.0 : 0.0);
  }

  void _changeAnimatedContainer() {
    setState(() {
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.red ? Colors.blue : Colors.red;
    });
  }

  //动画从0-1
  void _animateToOne() {
    final AnimationController controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _alpha = IntTween(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          value = controller.value;
        });
        print('${controller.value}-${_alpha.value}');
      });
    controller.forward();
  }

  void _toHeroPage() {
    Navigator.push(context, PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
      return new FadeTransition(
        opacity: animation,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Hero动画"),
          ),
          body: Center(
            child: Hero(
                tag: "photo",
                child: Image.network("http://pic1.win4000.com/wallpaper/a/59bb838ac9a22.jpg")),
          ),
        ),
      );
    }));
  }
}
