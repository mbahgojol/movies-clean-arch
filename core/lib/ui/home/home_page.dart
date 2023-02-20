import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            LocaleKeys.home_title,
            style: Theme.of(context).textTheme.titleLarge,
          ).tr(),
        ),
        body: SafeArea(
            child: ListView(
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
                    InkResponse(
                      onTap: () {},
                      child: Text(
                        LocaleKeys.more,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ).tr(),
                    )
                  ],
                ),
              ),
            ),
            _sectionMovies(context, LocaleKeys.popular.tr(), [], (id) => {}),
            _sectionMovies(
                context, LocaleKeys.now_playing.tr(), [], (id) => {}),
            _sectionMovies(context, LocaleKeys.on_tv.tr(), [], (id) => {}),
          ],
        )));
  }

  Widget _sectionMovies(BuildContext context, String titleSection,
      List<dynamic> data, Function(String) onClickItem) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.tv,
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.6),
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
                InkResponse(
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
            )
          ],
        ),
      ),
    );
  }
}
