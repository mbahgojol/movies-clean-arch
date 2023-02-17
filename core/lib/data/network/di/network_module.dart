import 'package:dependencies/dependencies.dart';

@module
abstract class NetworkModule {
  @Singleton(env: [Environment.dev])
  Dio get dioDev => Dio(BaseOptions(baseUrl: 'https://stg.example.com/api'))
    ..interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ))
    ..interceptors.add(ChuckerDioInterceptor());

  @Singleton(env: [Environment.prod])
  Dio get dioProd => Dio(BaseOptions(baseUrl: 'https://example.com/api'));
}
