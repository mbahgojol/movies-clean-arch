import 'package:core/data/network/datasources/home_data_source.dart';
import 'package:core/domain/repositories/home_respository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:injectable/injectable.dart';

import '../network/dtos/list_movies_response_dto.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(
    this.homeDataSource,
  );

  @override
  Future<ListMoviesResponseDto> getPopularListMovies() async =>
      await homeDataSource.getPopularListMovies();
}
