import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class SessionEntity extends Equatable {
  final UserEntity user;
  final String token;
  final String refreshToken;

  SessionEntity(
      {required this.user, required this.token, required this.refreshToken});
  @override
  List<Object?> get props => [user, token, refreshToken];
}
