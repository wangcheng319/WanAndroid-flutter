import 'package:flutter/material.dart';

class DialogDemoPage extends StatefulWidget {
  @override
  _DialogDemoPageState createState() => _DialogDemoPageState();
}

class _DialogDemoPageState extends State<DialogDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogDemo'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("AlertDialog"),
                onPressed: () {
                  _showAlertDialog();
                },
              ),
              RaisedButton(
                child: Text("showCustomDialog"),
                onPressed: () {
                  _showCustomDialog();
                },
              ),
              RaisedButton(
                child: Text("Loading"),
                onPressed: () {
                  _showLoadingDialog();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false, //点击影印不能取消
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("标题"),
            content: Text("这里放置内容文本"),
            actions: <Widget>[
              RaisedButton(
                child: Text("Ok", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print("ok");
                },
              ),
              RaisedButton(
                child: Text("Cancle", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print("cancle");
                  Navigator.of(context).pop();
                },
              )
            ],
            shape: BorderDirectional(
                start: BorderSide(color: Colors.blue, width: 2.0),
                end: BorderSide(color: Colors.blue, width: 2.0),
                top: BorderSide(color: Colors.blue, width: 2.0),
                bottom: BorderSide(color: Colors.blue, width: 2.0)),
          );
        });
  }

  void _showCustomDialog() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: RaisedButton(
              onPressed: null,
              child: Text(
                "11111",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
    );
  }

  void _showLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: Text("正在加载，请稍后..."),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
