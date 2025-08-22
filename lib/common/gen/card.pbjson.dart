// This is a generated file - do not edit.
//
// Generated from card.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cardDescriptor instead')
const Card$json = {
  '1': 'Card',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'number', '3': 2, '4': 1, '5': 9, '10': 'number'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'expiration_date', '3': 4, '4': 1, '5': 9, '10': 'expirationDate'},
    {'1': 'cvv', '3': 5, '4': 1, '5': 9, '10': 'cvv'},
  ],
};

/// Descriptor for `Card`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cardDescriptor = $convert.base64Decode(
    'CgRDYXJkEg4KAmlkGAEgASgJUgJpZBIWCgZudW1iZXIYAiABKAlSBm51bWJlchISCgRuYW1lGA'
    'MgASgJUgRuYW1lEicKD2V4cGlyYXRpb25fZGF0ZRgEIAEoCVIOZXhwaXJhdGlvbkRhdGUSEAoD'
    'Y3Z2GAUgASgJUgNjdnY=');

@$core.Deprecated('Use getCardRequestDescriptor instead')
const GetCardRequest$json = {
  '1': 'GetCardRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetCardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCardRequestDescriptor =
    $convert.base64Decode('Cg5HZXRDYXJkUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use getCardResponseDescriptor instead')
const GetCardResponse$json = {
  '1': 'GetCardResponse',
  '2': [
    {'1': 'card', '3': 1, '4': 1, '5': 11, '6': '.users.v1.Card', '10': 'card'},
  ],
};

/// Descriptor for `GetCardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCardResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRDYXJkUmVzcG9uc2USIgoEY2FyZBgBIAEoCzIOLnVzZXJzLnYxLkNhcmRSBGNhcmQ=');

@$core.Deprecated('Use listCardsRequestDescriptor instead')
const ListCardsRequest$json = {
  '1': 'ListCardsRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 2, '4': 1, '5': 9, '10': 'pageToken'},
  ],
};

/// Descriptor for `ListCardsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCardsRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0Q2FyZHNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoBVIIcGFnZVNpemUSHQoKcGFnZV'
    '90b2tlbhgCIAEoCVIJcGFnZVRva2Vu');

@$core.Deprecated('Use listCardsResponseDescriptor instead')
const ListCardsResponse$json = {
  '1': 'ListCardsResponse',
  '2': [
    {
      '1': 'cards',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.users.v1.Card',
      '10': 'cards'
    },
    {'1': 'next_page_token', '3': 2, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListCardsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCardsResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0Q2FyZHNSZXNwb25zZRIkCgVjYXJkcxgBIAMoCzIOLnVzZXJzLnYxLkNhcmRSBWNhcm'
    'RzEiYKD25leHRfcGFnZV90b2tlbhgCIAEoCVINbmV4dFBhZ2VUb2tlbg==');
