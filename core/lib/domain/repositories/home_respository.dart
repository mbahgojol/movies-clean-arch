import '../../data/network/dtos/list_movies_response_dto.dart';

abstract class HomeRepository {
  Future<ListMoviesResponseDto> getPopularListMovies();
}
