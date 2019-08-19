import 'package:wanandroid/store/modules/mainPage/state.dart';
import 'package:wanandroid/store/modules/secondPage/state.dart';

class AppState {
  final SecondPageState secondPageState;
  final MainPageState mainPageState;
  AppState({this.secondPageState, this.mainPageState});

  factory AppState.initial() {
    return AppState(
        secondPageState: SecondPageState.initial(), mainPageState: MainPageState.initial());
  }
}
