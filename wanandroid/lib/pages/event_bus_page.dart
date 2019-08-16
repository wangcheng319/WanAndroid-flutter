import 'package:wanandroid/models/order.dart';
import 'package:wanandroid/models/user.dart';

class UserLoggedInEvent {
  User user;

  UserLoggedInEvent(this.user);
}

class NewOrderEvent {
  Order order;

  NewOrderEvent(this.order);
}
