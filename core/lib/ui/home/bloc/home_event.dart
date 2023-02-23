part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getListPopularMovies() = _GetListPopularMovies;
  const factory HomeEvent.getListNowPlaying() = _GetListNowPlaying;
  const factory HomeEvent.getListOnTV() = _GetListOnTV;
}
