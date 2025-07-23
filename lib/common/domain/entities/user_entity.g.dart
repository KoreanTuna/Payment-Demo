// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  cards: (json['cards'] as List<dynamic>)
      .map((e) => CardScanEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cards': instance.cards,
    };
