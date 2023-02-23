import 'package:core/core.dart';
import 'package:core/data/network/dtos/list_movies_response_dto.dart';
import 'package:core/ui/home/bloc/home_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomeBloc>()..add(const HomeEvent.getListPopularMovies()),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              LocaleKeys.home_title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.background),
            ).tr(),
          ),
          body: SafeArea(
              child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.movie,
                        color: Theme.of(context).colorScheme.background,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        LocaleKeys.home_welcome,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.background),
                      ).tr(),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          LocaleKeys.more,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        ).tr(),
                      )
                    ],
                  ),
                ),
              ),
              _sectionMovies(context, LocaleKeys.popular.tr(), (id) => {}),
              _sectionMovies(context, LocaleKeys.now_playing.tr(), (id) => {}),
              _sectionMovies(context, LocaleKeys.on_tv.tr(), (id) => {}),
            ],
          ))),
    );
  }

  Widget _sectionMovies(
      BuildContext context, String titleSection, Function(String) onClickItem) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.tv,
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.6),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(titleSection,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.6))),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert,
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              child:
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                return state.resultPopulars.fold(
                    () => Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                    (a) => a.fold(
                        (error) => Center(
                              child: Text(
                                error.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                        (response) => ListView.separated(
                          shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: response.results.length,
                              itemBuilder: (context, position) {
                                var movie = response.results[position];
                                return _itemViewMovie(context, movie);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 16,
                              ),
                            )));
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemViewMovie(BuildContext context, ResultMovies movie) {
    return SizedBox(
      width: 100,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie.title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
