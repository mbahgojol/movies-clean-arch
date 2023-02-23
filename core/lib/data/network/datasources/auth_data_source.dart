import 'package:dependencies/dependencies.dart';
import 'package:shared/shared.dart';

import '../dtos/login_request_dto.dart';
import '../dtos/login_response_dto.dart';

@lazySingleton
class AuthDataSource {
  final Dio _dio;

  AuthDataSource(this._dio);

  Future<LoginResponseDto> login(LoginRequestDto loginRequestDto) async {
    try {
      final response = await _dio.post(
        '/login',
        data: loginRequestDto.toJson(),
      );

      final data = response as Map<String, dynamic>;

      return LoginResponseDto.fromJson(data['data']);
    } on DioError {
      throw ServerError();
    } catch (e) {
      throw UnexpectedError(message: e.toString());
    }
  }
}
