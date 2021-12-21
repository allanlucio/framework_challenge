part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.empty() = Empty;
  const factory AuthState.loading() = Loading;
  const factory AuthState.authenticated({required SessionEntity session}) =
      Authenticated;
  const factory AuthState.error({required String message}) = Error;
}
