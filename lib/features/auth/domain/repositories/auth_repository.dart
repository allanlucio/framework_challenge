import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/session_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, SessionEntity>> login({
    required String email,
    required String password,
  });
}
