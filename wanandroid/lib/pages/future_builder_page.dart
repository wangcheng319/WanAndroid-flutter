import 'package:flutter/material.dart';

///FutureBuilder用于异步请求
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
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  // 请求失败，显示错误
                  return Text("Error: ${snapshot.error}");
                } else {
                  // 请求成功，显示数据
                  return Text("Contents: ${snapshot.data}");
                }
              } else {
                // 请求未结束，显示loading
                return CircularProgressIndicator();
//                _showLoadingDialog();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> _getData() async {
    return Future.delayed(Duration(seconds: 3), () {
      return "获取到的数据";
    });
  }

  void _showLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("加载中……"),
                )
              ],
            ),
          );
        });
  }
}
