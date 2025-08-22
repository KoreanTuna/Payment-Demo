import 'package:grpc/grpc.dart';
import 'package:payment_demo/common/data/datasource/card_datasource.dart';
import 'package:payment_demo/common/data/grpc_mapper/card_grpc_mapper.dart';
import 'package:payment_demo/common/data/models/card_model.dart';
import 'package:payment_demo/core/exception/custom_exception.dart';
import 'package:payment_demo/core/util/result.dart';

class CardRepositoryImpl {
  final CardGrpcDataSource _ds;

  CardRepositoryImpl(this._ds);

  Future<Result<CardModel>> getCard(String id) async {
    try {
      final pbCard = await _ds.getCard(id);

      return Result.ok(CardMapper.fromPb(pbCard));
    } on GrpcError {
      // return (data: null, error: _mapGrpcError(e));
      return Result.error(CustomNetworkException('gRPC Error'));
    } catch (e) {
      return Result.error(CustomNetworkException(e.toString()));
    }
  }

  // Failure _mapGrpcError(GrpcError e) {
  //   switch (e.code) {
  //     case StatusCode.unauthenticated:
  //       return UnauthorizedFailure(e.message ?? 'Unauthenticated');
  //     case StatusCode.notFound:
  //       return NotFoundFailure(e.message ?? 'Not Found');
  //     case StatusCode.unavailable:
  //     case StatusCode.deadlineExceeded:
  //       return NetworkFailure(e.message ?? 'Network Error');
  //     default:
  //       return UnknownFailure('(${e.code}) ${e.message}');
  //   }
  // }
}
