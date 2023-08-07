import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_smart_home_app_demo3/infrastructure/api/client/weather_api_service.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  getIt.registerFactory<WeatherApiService>(() => WeatherApiService.create());
}
