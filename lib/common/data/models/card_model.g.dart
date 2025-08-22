// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardModel _$CardModelFromJson(Map<String, dynamic> json) => _CardModel(
  id: json['id'] as String,
  name: json['name'] as String,
  number: json['number'] as String,
  expiryDate: json['expiryDate'] as String,
  cvv: json['cvv'] as String,
);

Map<String, dynamic> _$CardModelToJson(_CardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
    };
