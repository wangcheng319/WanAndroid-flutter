import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
   String phone;
   String password;

   String deviceToken;
   String deviceModel;
   String systemVersion;
   String networkType;
   String location;
   String longitude;
   String latitude;
   bool isEm;
   String unionId;

   LoginRequest({this.phone,this.password,this.deviceToken,this.deviceModel,this.systemVersion,this.networkType,this.location,this.longitude,
   this.latitude,this.isEm,this.unionId
   });

   factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

   Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}