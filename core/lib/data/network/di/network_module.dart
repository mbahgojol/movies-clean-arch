import 'package:dependencies/dependencies.dart';

@module
abstract class NetworkModule {
  @Singleton(env: [Environment.dev])
  Dio get dioDev =>
      Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/movie/'))
        ..interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ))
        ..interceptors.add(ChuckerDioInterceptor());

  @Singleton(env: [Environment.prod])
  Dio get dioProd =>
      Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/movie/'));
}
