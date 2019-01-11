// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banneritem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) {
  return BannerItem(
      data: (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Banner.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String);
}

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
