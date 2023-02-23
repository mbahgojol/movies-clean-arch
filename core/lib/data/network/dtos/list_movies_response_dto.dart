import 'package:dependencies/dependencies.dart';

part 'list_movies_response_dto.freezed.dart';

part 'list_movies_response_dto.g.dart';

@freezed
class ListMoviesResponseDto with _$ListMoviesResponseDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ListMoviesResponseDto({
    required int page,
    required List<ResultMovies> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _ListMoviesResponseDto;

  factory ListMoviesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ListMoviesResponseDtoFromJson(json);
}

@freezed
class ResultMovies with _$ResultMovies {
  const factory ResultMovies({
    required String title,
    required bool adult,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required int id,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _ResultMovies;

  factory ResultMovies.fromJson(Map<String, dynamic> json) =>
      _$ResultMoviesFromJson(json);
}
