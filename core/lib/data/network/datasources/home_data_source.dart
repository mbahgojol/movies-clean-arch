import 'dart:convert';

import 'package:core/data/network/dtos/list_movies_response_dto.dart';
import 'package:dependencies/dependencies.dart';
import 'package:shared/shared.dart';

@lazySingleton
class HomeDataSource {
  final Dio _dio;

  HomeDataSource(this._dio);

  Future<ListMoviesResponseDto> getPopularListMovies() async {
    try {
      final response = await _dio.get(
        'popular${LocaleKeys.api_key.tr()}',
      );

      var data = json.decode(response.toString());

      return ListMoviesResponseDto.fromJson(data);
    } on DioError {
      throw ServerError();
    } catch (e) {
      throw UnexpectedError(message: e.toString());
    }
  }
}
