part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
    const factory LoginEvent.phoneNumberChanged(String value) = _PhoneNumberChanged;
    const factory LoginEvent.proceed() = _Proceed;
}