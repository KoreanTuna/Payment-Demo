import 'package:grpc/grpc.dart';
import 'package:payment_demo/common/gen/card.pbgrpc.dart' as stubs;

class CardGrpcDataSource {
  final stubs.CardServiceClient _client;

  CardGrpcDataSource(
    ClientChannel channel, {
    CallOptions? options,
    List<ClientInterceptor>? interceptors,
  }) : _client = stubs.CardServiceClient(
         channel,
         options: options,
         interceptors: interceptors,
       );

  Future<stubs.Card> getCard(String id) async {
    final res = await _client.getCard(stubs.GetCardRequest(id: id));
    return res.card;
  }

  Future<({List<stubs.Card> cards, String? nextPageToken})> listCards({
    int pageSize = 20,
    String? pageToken,
  }) async {
    final res = await _client.listCards(
      stubs.ListCardsRequest(pageSize: pageSize, pageToken: pageToken ?? ''),
    );
    return (
      cards: res.cards,
      nextPageToken: res.nextPageToken.isEmpty ? null : res.nextPageToken,
    );
  }
}
