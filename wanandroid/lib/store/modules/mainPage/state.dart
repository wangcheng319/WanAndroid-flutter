import 'package:wanandroid/models/user.dart';

class MainPageState {
  int counter;
  User user;
  MainPageState({this.counter: 0, this.user});

  factory MainPageState.initial() {
    return new MainPageState(counter: 0);
  }
}
