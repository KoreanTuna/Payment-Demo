import 'package:grpc/grpc.dart';

/// 모든 호출에 Authorization 헤더를 삽입하는 인터셉터
class AuthClientInterceptor extends ClientInterceptor {
  final Future<String?> Function() tokenProvider;
  AuthClientInterceptor(this.tokenProvider);

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    invoker,
  ) {
    return invoker(
      method,
      request,
      _withAuth(options),
    );
  }

  CallOptions _withAuth(CallOptions options) {
    return CallOptions(
      metadata: {
        ...options.metadata,
      },
      providers: [
        ...options.metadataProviders,
        (Map<String, String> metadata, String uri) async {
          final token = await tokenProvider();
          if (token != null && token.isNotEmpty) {
            metadata['authorization'] = 'Bearer $token';
          }
        },
      ],
      timeout: options.timeout,
      compression: options.compression,
    );
  }
}
