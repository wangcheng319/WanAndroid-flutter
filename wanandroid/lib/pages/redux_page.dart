import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:wanandroid/models/user.dart';
import 'package:wanandroid/store/app/AppState.dart';
import 'package:wanandroid/store/modules/mainPage/action.dart';
import 'package:wanandroid/store/modules/mainPage/state.dart';
import 'package:wanandroid/store/modules/secondPage/action.dart';

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
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              ///获取state数据
              Container(
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (BuildContext context, vm) {
                    return Column(
                      children: <Widget>[
                        Text(vm.mainPageState.counter.toString()),
                        Text(vm.secondPageState.counter.toString()),
                        Text(vm.mainPageState.user.name),
                      ],
                    );
                  },
                ),
              ),

              ///修改state数据
              Container(
                child: StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
//                return () => store.dispatch(IncreaseAction(num: 10));
                    return () {
                      store.dispatch(IncreaseAction(num: 10));
                      store.dispatch(SecondIncreaseAction(num: 20));
                      store.dispatch(SaveUserInfoAction(user: User(name: 'Wangc', age: 3)));
                    };
                  },
                  builder: (context, callback) {
                    return FloatingActionButton(
                      onPressed: callback,
                      child: Icon(Icons.add),
                    );
                  },
                ),
              ),

              Container(
                child: StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
//                return () => store.dispatch(IncreaseAction(num: 10));
                    return () {
                      store.dispatch(SubtractAction(num: 10));
                    };
                  },
                  builder: (context, callback) {
                    return RaisedButton(
                      onPressed: callback,
                      child: Text('减'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
