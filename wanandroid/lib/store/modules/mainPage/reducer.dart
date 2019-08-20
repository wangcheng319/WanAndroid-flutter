import 'package:redux/redux.dart';
import 'package:wanandroid/store/modules/mainPage/action.dart';
import 'package:wanandroid/store/modules/mainPage/state.dart';

final mainPageReducer = combineReducers<MainPageState>([
  TypedReducer<MainPageState, IncreaseAction>(_increase),
  TypedReducer<MainPageState, SubtractAction>(_subtract),
  TypedReducer<MainPageState, SaveUserInfoAction>(_saveUser)
]);

MainPageState _increase(MainPageState state, IncreaseAction action) {
  state.counter += action.num;
  return state;
}

MainPageState _subtract(MainPageState state, SubtractAction action) {
  state.counter -= action.num;
  return state;
}

MainPageState _saveUser(MainPageState state, SaveUserInfoAction action) {
  state.user = action.user;
  return state;
}
