import 'package:redux/redux.dart';
import 'package:wanandroid/store/modules/secondPage/action.dart';
import 'package:wanandroid/store/modules/secondPage/state.dart';

final secondPageReducer =
    combineReducers<SecondPageState>([TypedReducer<SecondPageState, IncreaseAction>(_increase)]);

SecondPageState _increase(SecondPageState state, IncreaseAction action) {
  state.counter += 1;
  return state;
}
