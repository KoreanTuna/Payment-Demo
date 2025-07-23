// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardScanModel _$CardScanModelFromJson(Map<String, dynamic> json) =>
    _CardScanModel(
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expirationYear: (json['expirationYear'] as num).toInt(),
      expirationMonth: (json['expirationMonth'] as num).toInt(),
      cvc: (json['cvc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CardScanModelToJson(_CardScanModel instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'cardHolderName': instance.cardHolderName,
      'expirationYear': instance.expirationYear,
      'expirationMonth': instance.expirationMonth,
      'cvc': instance.cvc,
    };
