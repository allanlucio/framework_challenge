import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/session_entity.dart';
import '../repositories/auth_repository.dart';

abstract class Login {
  Future<Either<Failure, SessionEntity>> call(
      {required String email, required String password});
}

class LoginImpl implements Login {
  final AuthRepository authRepository;

  LoginImpl({required this.authRepository});
  Future<Either<Failure, SessionEntity>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(email: email, password: password);
  }
}
