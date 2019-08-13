import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("FutureBuilder使用"),
          ],
        ),
      ),
    );
  }
}
