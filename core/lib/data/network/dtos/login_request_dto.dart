import 'package:dependencies/dependencies.dart';

part 'login_request_dto.freezed.dart';

part 'login_request_dto.g.dart';

@freezed
class LoginRequestDto with _$LoginRequestDto {
  const factory LoginRequestDto({
    @JsonValue("email") required String emailAddress,
    @JsonValue("password") required String password,
  }) = _LoginRequestDto;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);
}
