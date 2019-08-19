import 'package:redux/redux.dart';
import 'package:wanandroid/store/modules/secondPage/action.dart';
import 'package:wanandroid/store/modules/secondPage/state.dart';

final secondPageReducer = combineReducers<SecondPageState>(
    [TypedReducer<SecondPageState, SecondIncreaseAction>(_increase)]);

SecondPageState _increase(SecondPageState state, SecondIncreaseAction action) {
  state.counter += action.num;
  return state;
}
