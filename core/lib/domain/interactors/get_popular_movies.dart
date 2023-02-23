import 'package:core/domain/repositories/home_respository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../data/network/dtos/list_movies_response_dto.dart';

@lazySingleton
class GetPopularMovies extends ResultInteractor<ListMoviesResponseDto> {
  final HomeRepository homeRepository;

  GetPopularMovies(this.homeRepository);

  @override
  Future<ListMoviesResponseDto> doWork() async =>
      await homeRepository.getPopularListMovies();
}
