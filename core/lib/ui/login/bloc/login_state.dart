part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required String phoneNumber,
    required bool processing,
    required Result result,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        phoneNumber: "",
        processing: false,
        result: None(),
      );
}
