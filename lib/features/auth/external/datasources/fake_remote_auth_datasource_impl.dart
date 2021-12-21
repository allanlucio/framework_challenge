import '../../../../core/config/config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../infra/datasources/remote_auth_datasource.dart';
import '../../infra/models/session_model.dart';
import '../../infra/models/user_model.dart';

class FakeRemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  FakeRemoteAuthDataSourceImpl();
  @override
  Future<SessionModel> login(
      {required String email, required String password}) async {
    if (email == LOGIN_LOCAL_EMAIL && password == LOGIN_LOCAL_PASSWORD) {
      return SessionModel(
          user: UserModel(name: "test", email: email),
          token: "token",
          refreshToken: "token");
    } else {
      throw AuthExeption();
    }
  }
}
