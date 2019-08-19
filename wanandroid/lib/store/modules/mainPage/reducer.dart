import 'package:redux/redux.dart';
import 'package:wanandroid/store/modules/mainPage/action.dart';
import 'package:wanandroid/store/modules/mainPage/state.dart';

final mainPageReducer = combineReducers<MainPageState>([
  TypedReducer<MainPageState, IncreaseAction>(_increase),
  TypedReducer<MainPageState, SubtractAction>(_subtract)
]);

MainPageState _increase(MainPageState state, IncreaseAction action) {
  state.counter += action.num;
  return state;
}

MainPageState _subtract(MainPageState state, SubtractAction action) {
  state.counter -= action.num;
  return state;
}
