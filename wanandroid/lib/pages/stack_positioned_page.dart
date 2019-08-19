import 'package:flutter/material.dart';
import 'package:wanandroid/main.dart';
import 'package:wanandroid/pages/event_bus_page.dart';

class StackPositionedPage extends StatefulWidget {
  @override
  _StackPositionedPageState createState() => _StackPositionedPageState();
}

///Stack类似Android中的FrameLayout,Positioned则根据Stack来定位
class _StackPositionedPageState extends State<StackPositionedPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("==================");
    eventBus.on<UserLoggedInEvent>().listen((event) {
      print("接收事件：" + event.user.name);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("StackPositionedDemo"),
          centerTitle: true,
          //自定义返回按钮
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            child: Center(
              child: Text('返回'),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          )),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                color: Colors.blue,
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              left: 20,
              top: 20,
            ),
            Positioned(
              child: Container(
                color: Colors.blue,
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  '2',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              left: MediaQuery.of(context).size.width - 50,
              top: MediaQuery.of(context).size.height - 150,
            ),
            Positioned(
              child: Container(
                color: Colors.blue,
                width: 150,
                height: 50,
                alignment: Alignment.center,
                child: FlatButton(
                    onPressed: null,
                    child: Text(
                      '返回',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              left: MediaQuery.of(context).size.width / 2 - 50,
              top: MediaQuery.of(context).size.height / 2 - 150,
            ),
          ],
        ),
      ),
    );
  }
}
