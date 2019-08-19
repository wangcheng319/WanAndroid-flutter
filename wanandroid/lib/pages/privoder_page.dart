import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid/models/user.dart';
import 'package:wanandroid/provider/CounterModel.dart';
import 'package:wanandroid/provider/UserProvider.dart';

class PrivoderPage extends StatefulWidget {
  @override
  _PrivoderPageState createState() => _PrivoderPageState();
}

class _PrivoderPageState extends State<PrivoderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderDemo"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("${Provider.of<CounterModel>(context).value}"),
          ),
          RaisedButton(
            onPressed: () {
              Provider.of<CounterModel>(context).add();
            },
            child: Text("Provider增加"),
          )
        ],
      ),
    );
  }
}
