import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureInjection(env);

  runApp(EasyLocalization(
    supportedLocales: const [Locale('id')],
    path: 'libraries/shared/assets/translations',
    fallbackLocale: const Locale('id'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: child,
        );
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [ChuckerFlutter.navigatorObserver],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      themeMode: ThemeMode.light,
      theme: kLightTheme,
    );
  }
}
