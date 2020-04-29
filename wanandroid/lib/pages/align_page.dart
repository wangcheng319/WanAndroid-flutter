import 'package:flutter/material.dart';

class AlignDemoPage extends StatefulWidget {
  @override
  _AlignDemoPageState createState() => _AlignDemoPageState();
}

class _AlignDemoPageState extends State<AlignDemoPage> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlignDemo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: BorderDirectional(
                    start: BorderSide(color: Colors.red, width: 2.0),
                    end: BorderSide(color: Colors.red, width: 2.0),
                    top: BorderSide(color: Colors.red, width: 2.0),
                    bottom: BorderSide(color: Colors.red, width: 2.0)),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: FlutterLogo(
                  size: 30,
                ),
              ),
            ),

            ///控制组件显示隐藏
            Offstage(
              offstage: isShow,
              child: Text('Offstage'),
            ),
            RaisedButton(onPressed: () {
              setState(() {
                isShow = !isShow;
              });
            })
          ],
        ),
      ),
    );
  }
}
