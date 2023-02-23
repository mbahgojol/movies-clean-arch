import 'package:core/data/network/dtos/list_movies_response_dto.dart';
import 'package:core/domain/interactors/get_popular_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:dependencies/dependencies.dart';
import 'package:shared/shared.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPopularMovies getPopularMovies;

  HomeBloc(this.getPopularMovies) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
          getListPopularMovies: (e) async {
            emit(state.copyWith(
              processingPopulars: true,
              resultPopulars: none(),
            ));

            final result = await getPopularMovies();
            emit(state.copyWith(
              processingPopulars: false,
              resultPopulars: result,
            ));
          },
          getListNowPlaying: (e) async {},
          getListOnTV: (e) async {});
    });
  }
}
