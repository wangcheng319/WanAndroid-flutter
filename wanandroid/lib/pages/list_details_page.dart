import 'package:flutter/material.dart';

class ListDetailsPage extends StatefulWidget {
  ListDetailsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListDetailsPageState createState() => new _ListDetailsPageState(title: title);
}

class _ListDetailsPageState extends State<ListDetailsPage> {
  _ListDetailsPageState({Key key, this.title});
  final String title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("" + title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("this is list details page"),
            RaisedButton(
              child: Text("返回" + title),
              onPressed: () {
                //返回，传值
                Navigator.pop(context, "return data");
              },
            )
          ],
        ),
      ),
    );
  }
}
