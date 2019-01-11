import 'package:json_annotation/json_annotation.dart';
import 'banner.dart';

part 'banneritem.g.dart';

@JsonSerializable()
class BannerItem extends Object{
  final List<Banner> data;
  final int errorCode;
  final String errorMsg;

  BannerItem({this.data,this.errorCode,this.errorMsg});

  factory BannerItem.fromJson(Map<String, dynamic> json) => _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}