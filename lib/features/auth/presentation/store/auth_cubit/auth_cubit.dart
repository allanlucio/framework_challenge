import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/session_entity.dart';
import '../../../domain/usecases/login_usecase.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

const AUTH_FAILURE_MESSAGE = "As credenciais do usuário são inválidas.";

class AuthCubit extends Cubit<AuthState> {
  final Login loginUsecase;

  AuthCubit({
    required this.loginUsecase,
  }) : super(AuthState.empty());

  void login({required String email, required String password}) async {
    emit(AuthState.loading());
    final resultEither = await loginUsecase(email: email, password: password);
    resultEither.fold(
      (failure) => emit(AuthState.error(message: failureToMessage(failure))),
      (session) => emit(
        AuthState.authenticated(session: session),
      ),
    );
  }

  String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case AuthFailure:
        return AUTH_FAILURE_MESSAGE;
      default:
        return "Tente novamente!";
    }
  }
}
