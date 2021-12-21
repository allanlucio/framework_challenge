import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/session_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, SessionEntity>> login(
      {required String email, required String password}) async {
    try {
      final session =
          await remoteDataSource.login(email: email, password: password);

      return Right(session);
    } on AuthExeption {
      return Left(AuthFailure());
    }
  }
}
