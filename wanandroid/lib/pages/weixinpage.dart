import 'package:flutter/material.dart';
import 'mepage.dart';

class WxPage extends StatefulWidget {
  String a;

  @override
  _WxPageState createState() => _WxPageState();
}

class _WxPageState extends State<WxPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String b;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    print("3创建");
    Navigator.push<String>(
            context, new MaterialPageRoute(builder: (BuildContext context) {}))
        .then((String result) {
      //处理代码
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("公众号"),
    );
  }
}
