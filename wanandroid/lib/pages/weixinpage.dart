import 'package:flutter/material.dart';

class WxPage extends StatefulWidget {
  @override
  _WxPageState createState() => _WxPageState();
}

class _WxPageState extends State<WxPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
    return Container(
      child: Text("公众号"),
    );
  }
}
