import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid/main.dart';
import 'package:wanandroid/models/user.dart';
import 'package:wanandroid/pages/event_bus_page.dart';
import 'package:wanandroid/pages/list_details_page.dart';
import 'package:wanandroid/provider/CounterModel.dart';
import 'package:wanandroid/store/app/AppState.dart';
import 'package:wanandroid/store/modules/mainPage/state.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> with TickerProviderStateMixin {
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
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 20,
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
            RaisedButton(
              child: Text("AlertDialog"),
              onPressed: () {
                Navigator.of(context).pushNamed("/dialog_page");
              },
            ),
            RaisedButton(
              child: Text("Align"),
              onPressed: () {
                Navigator.of(context).pushNamed("/align_page");
              },
            ),
            RaisedButton(
              child: Text("动画"),
              onPressed: () {
                Navigator.of(context).pushNamed("/animate_page");
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/event_page');
              },
              child: Text("事件"),
            ),
            MultiProvider(
              providers: [Provider<User>.value(value: User(name: "jack", age: 33))],
              child: RaisedButton(
                  child: Text("Stack,Positioned"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/stack_positioned_page');
                  }),
            ),
            RaisedButton(
                child: Text("EventBus"),
                onPressed: () {
                  User user = new User();
                  user.name = "张三";
                  user.age = 3;
                  eventBus.fire(new UserLoggedInEvent(user));
                  print("发送");
                  Navigator.of(context).pushNamed('/stack_positioned_page');
                }),
            RaisedButton(
                child: Text("Provider:${Provider.of<CounterModel>(context).value}"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/provider_page');
                }),

            ///redux
            RaisedButton(
                child: StoreConnector<AppState, MainPageState>(
                  converter: (store) => store.state.mainPageState,
                  builder: (BuildContext context, vm) {
                    return Column(
                      children: <Widget>[
                        Text('redux:' + vm.counter.toString()),
                      ],
                    );
                  },
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/redux_page');
                }),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/method_channel_page');
              },
              child: Text('MethodChannel原生交互'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black54, offset: Offset(4.0, 4.0), blurRadius: 8.0)
                  ],
                  gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]), //背景渐变
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.red, style: BorderStyle.solid)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Container",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
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
