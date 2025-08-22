// This is a generated file - do not edit.
//
// Generated from card.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'card.pb.dart' as $0;

export 'card.pb.dart';

@$pb.GrpcServiceName('users.v1.CardService')
class CardServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CardServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetCardResponse> getCard(
    $0.GetCardRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCard, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListCardsResponse> listCards(
    $0.ListCardsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listCards, request, options: options);
  }

  // method descriptors

  static final _$getCard =
      $grpc.ClientMethod<$0.GetCardRequest, $0.GetCardResponse>(
          '/users.v1.CardService/GetCard',
          ($0.GetCardRequest value) => value.writeToBuffer(),
          $0.GetCardResponse.fromBuffer);
  static final _$listCards =
      $grpc.ClientMethod<$0.ListCardsRequest, $0.ListCardsResponse>(
          '/users.v1.CardService/ListCards',
          ($0.ListCardsRequest value) => value.writeToBuffer(),
          $0.ListCardsResponse.fromBuffer);
}

@$pb.GrpcServiceName('users.v1.CardService')
abstract class CardServiceBase extends $grpc.Service {
  $core.String get $name => 'users.v1.CardService';

  CardServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetCardRequest, $0.GetCardResponse>(
        'GetCard',
        getCard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCardRequest.fromBuffer(value),
        ($0.GetCardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListCardsRequest, $0.ListCardsResponse>(
        'ListCards',
        listCards_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListCardsRequest.fromBuffer(value),
        ($0.ListCardsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetCardResponse> getCard_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetCardRequest> $request) async {
    return getCard($call, await $request);
  }

  $async.Future<$0.GetCardResponse> getCard(
      $grpc.ServiceCall call, $0.GetCardRequest request);

  $async.Future<$0.ListCardsResponse> listCards_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListCardsRequest> $request) async {
    return listCards($call, await $request);
  }

  $async.Future<$0.ListCardsResponse> listCards(
      $grpc.ServiceCall call, $0.ListCardsRequest request);
}
