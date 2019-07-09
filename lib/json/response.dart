import 'package:json_annotation/json_annotation.dart';

part "response.g.dart";

@JsonSerializable()
class BaseResponse extends Object{
  final List<Barber> barbers;

  BaseResponse(this.barbers);

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class Barber extends Object{
  final String name;
  final String address;
  final String icon;
  final String phone;
  final List<String> images;

  Barber(this.name, this.address, this.icon, this.phone, this.images);

  factory Barber.fromJson(Map<String, dynamic> json) => _$BarberFromJson(json);
  Map<String, dynamic> toJson() => _$BarberToJson(this);
}
