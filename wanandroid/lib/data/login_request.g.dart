// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return LoginRequest(
      phone: json['phone'] as String,
      password: json['password'] as String,
      deviceToken: json['deviceToken'] as String,
      deviceModel: json['deviceModel'] as String,
      systemVersion: json['systemVersion'] as String,
      networkType: json['networkType'] as String,
      location: json['location'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      isEm: json['isEm'] as bool,
      unionId: json['unionId'] as String);
}

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'deviceToken': instance.deviceToken,
      'deviceModel': instance.deviceModel,
      'systemVersion': instance.systemVersion,
      'networkType': instance.networkType,
      'location': instance.location,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'isEm': instance.isEm,
      'unionId': instance.unionId
    };
