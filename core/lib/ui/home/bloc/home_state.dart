part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool processingPopulars,
    required bool processingNowPlaying,
    required bool processingOnTV,
    required Result<ListMoviesResponseDto> resultPopulars,
    required Result resultNowPlaying,
    required Result resultOnTV,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
      resultPopulars: None(),
      resultOnTV: None(),
      resultNowPlaying: None(),
      processingNowPlaying: false,
      processingOnTV: false,
      processingPopulars: false);
}
