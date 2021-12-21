import '../../domain/entities/session_entity.dart';
import 'user_model.dart';

class SessionModel extends SessionEntity {
  final UserModel user;
  SessionModel({
    required this.user,
    required String token,
    required String refreshToken,
  }) : super(user: user, token: token, refreshToken: refreshToken);

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    final user = UserModel(name: json["name"], email: json["email"]);
    return SessionModel(
        user: user,
        token: json["access_token"],
        refreshToken: json["refresh_token"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": user.name,
      "email": user.email,
      "access_token": token,
      "refresh_token": refreshToken
    };
  }
}
