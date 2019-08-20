import 'package:wanandroid/models/user.dart';

class IncreaseAction {
  int num;
  IncreaseAction({this.num});
}

class SubtractAction {
  int num;
  SubtractAction({this.num});
}

class SaveUserInfoAction {
  User user;
  SaveUserInfoAction({this.user});
}
