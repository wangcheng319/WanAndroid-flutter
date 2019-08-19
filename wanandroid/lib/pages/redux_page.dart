import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wanandroid/store/app/AppState.dart';
import 'package:wanandroid/store/modules/mainPage/action.dart';
import 'package:wanandroid/store/modules/mainPage/state.dart';

class ReduxDemo extends StatefulWidget {
  @override
  _ReduxDemoState createState() => _ReduxDemoState();
}

class _ReduxDemoState extends State<ReduxDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReduxDemo"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ///获取state数据
          Container(
            child: StoreConnector<AppState, MainPageState>(
              converter: (store) => store.state.mainPageState,
              builder: (BuildContext context, vm) {
                return Column(
                  children: <Widget>[
                    Text(vm.counter.toString()),
                  ],
                );
              },
            ),
          ),

          ///修改state数据
          Container(
            child: StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(IncreaseAction(num: 10));
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  child: Icon(Icons.add),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
