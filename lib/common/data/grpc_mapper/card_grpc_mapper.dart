import 'package:meta/meta.dart';
import 'package:payment_demo/common/data/models/card_model.dart';
import 'package:payment_demo/common/gen/card.pb.dart' as pb;

@immutable
class CardMapper {
  static CardModel fromPb(pb.Card c) {
    return CardModel(
      id: c.id,
      name: c.name,
      number: c.number,
      expiryDate: c.expirationDate,
      cvv: c.cvv,
    );
  }

  static pb.Card toPb(CardModel c) {
    return pb.Card(
      id: c.id,
      name: c.name,
      number: c.number,
      expirationDate: c.expiryDate,
      cvv: c.cvv,
    );
  }
}
