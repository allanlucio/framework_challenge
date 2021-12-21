import '../models/session_model.dart';

abstract class RemoteAuthDataSource {
  Future<SessionModel> login({
    required String email,
    required String password,
  });
}
