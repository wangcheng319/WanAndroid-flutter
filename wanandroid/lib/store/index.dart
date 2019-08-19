//store数据入口
import 'package:redux/redux.dart';
import 'package:wanandroid/store/app/AppState.dart';
import 'package:wanandroid/store/app/AppReducer.dart';

Store<AppState> createStore() {
  return Store(appReducer, initialState: AppState.initial());
}
