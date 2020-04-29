import 'package:flutter/widgets.dart';
import 'package:wanandroid/pages/align_page.dart';
import 'package:wanandroid/pages/animate_page.dart';
import 'package:wanandroid/pages/dialog_page.dart';
import 'package:wanandroid/pages/event_page.dart';
import 'package:wanandroid/pages/future_builder_page.dart';
import 'package:wanandroid/pages/list_details_page.dart';
import 'package:wanandroid/pages/method_channel_page.dart';
import 'package:wanandroid/pages/privoder_page.dart';
import 'package:wanandroid/pages/redux_page.dart';
import 'package:wanandroid/pages/stack_positioned_page.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    '/list_details': (BuildContext context) => ListDetailsPage(),
    '/future_builder_page': (BuildContext context) => FutureBuilderPage(),
    '/align_page': (BuildContext context) => AlignDemoPage(),
    '/animate_page': (BuildContext context) => AnimateDemoPage(),
    '/stack_positioned_page': (BuildContext context) => StackPositionedPage(),
    '/dialog_page': (BuildContext context) => DialogDemoPage(),
    '/event_page': (BuildContext context) => EventDemoPage(),
    '/provider_page': (BuildContext context) => PrivoderPage(),
    '/redux_page': (BuildContext context) => ReduxDemo(),
    '/method_channel_page': (BuildContext context) => MethodChannelDemo(),
  };
}
