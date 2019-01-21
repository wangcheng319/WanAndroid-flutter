import 'package:flutter/material.dart';
import 'mepage.dart';
import 'dart:ui';

class WxPage extends StatefulWidget {
  String a;

  @override
  _WxPageState createState() => _WxPageState();
}

class _WxPageState extends State<WxPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String b;
  double width = 50;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    print("3创建");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: _add,
              child: Text("加"),
              textColor: Colors.white,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            FlatButton(
              onPressed: _reduce,
              child: Text("减"),
              textColor: Colors.white,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            Container(
              child: AndroidView(viewType: "nativeview"),//利用AndroidView引入原生Android控件
              width: 200,
              height: 200,
            ),
            CustomPaint(
              painter: MyView(width: width),
            ),
          ],
        ),
      ),
    );
  }

  _add() {
    setState(() {
      width = width + 20;
    });
  }

  _reduce() {
    setState(() {
      width = width - 20;
    });
  }
}

class MyView extends CustomPainter {
  MyView({this.width});

  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(0, 0), width, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
