import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/domain/entities/user_entity.dart';
import 'package:payment_demo/common/provider/user_provider.dart';

mixin class UserState {
  UserEntity getUser(WidgetRef ref) => ref.watch(userProvider);
}
