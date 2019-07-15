// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse((json['barbers'] as List)
      ?.map(
          (e) => e == null ? null : Barber.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{'barbers': instance.barbers};

Barber _$BarberFromJson(Map<String, dynamic> json) {
  return Barber(
      json['name'] as String,
      json['address'] as String,
      json['icon'] as String,
      json['phone'] as String,
      json['images'].cast<String>());
}

Map<String, dynamic> _$BarberToJson(Barber instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'icon': instance.icon,
      'phone': instance.phone,
      'images': instance.images
    };
