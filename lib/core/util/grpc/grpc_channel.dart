import 'package:grpc/grpc.dart';

class GrpcFactory {
  /// dev: Insecure, prod: TLS 적용 (사내 CA 인증서 사용 가능)
  static ClientChannel create({
    required String host,
    int port = 443,
    bool useTls = true,
    ChannelCredentials? credentials,
  }) {
    return ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials:
            credentials ??
            (useTls
                ? const ChannelCredentials.secure()
                : const ChannelCredentials.insecure()),
        codecRegistry: CodecRegistry(
          codecs: const [GzipCodec(), IdentityCodec()],
        ),
      ),
    );
  }
}
