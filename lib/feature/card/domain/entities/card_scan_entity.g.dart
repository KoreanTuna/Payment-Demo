// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_scan_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardScanEntity _$CardScanEntityFromJson(Map<String, dynamic> json) =>
    _CardScanEntity(
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expirationYear: (json['expirationYear'] as num).toInt(),
      expirationMonth: (json['expirationMonth'] as num).toInt(),
      cvc: (json['cvc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CardScanEntityToJson(_CardScanEntity instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'cardHolderName': instance.cardHolderName,
      'expirationYear': instance.expirationYear,
      'expirationMonth': instance.expirationMonth,
      'cvc': instance.cvc,
    };
