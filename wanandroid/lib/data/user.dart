import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

///  先添加 part 'user.g.dart';
///  flutter packages pub run build_runner build
///  运行上面的命令自动生成user.g.dart文件

@JsonSerializable()
class User extends Object {
  final String name;
  final int age;

  User({this.name,this.age});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

//  序列化和反序列化
//  User user = User(name: "zhangs",age: 3);
//  print(user.age);
//
//  Map jsonuser = user.toJson();
//  print(jsonuser["name"]);
//
//  User user1 = User.fromJson(jsonuser);
//  print(user1.name);

}