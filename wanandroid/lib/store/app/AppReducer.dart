import 'package:wanandroid/store/app/AppState.dart';
import 'package:wanandroid/store/modules/mainPage/reducer.dart';
import 'package:wanandroid/store/modules/secondPage/reducer.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
    secondPageState: secondPageReducer(state.secondPageState, action),
    mainPageState: mainPageReducer(state.mainPageState, action));
