import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  Dio createGitHubDio() => Dio()
    ..options = BaseOptions(headers: {})
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        compact: false,
      ),
    );
}
