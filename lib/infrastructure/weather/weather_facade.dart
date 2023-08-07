import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_smart_home_app_demo3/domain/core/failures.dart';
import 'package:flutter_smart_home_app_demo3/infrastructure/api/client/weather_api_service.dart';

import '../../di/injection.dart';
import '../../domain/entities/api_response.dart';
import '../../domain/weather/i_weather_facade.dart';
import '../api/exception/exception.dart';

@LazySingleton(as: IWeatherFacade)
class WeatherFacade with HttpHandlerMixin implements IWeatherFacade {
  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> getCurrentWeather(
      String appId, double lat, double long) async {
    Response? result;
    try {
      final result =
          await getIt<WeatherApiService>().getCurrentWeather(lat, long, appId);

      if (result.isSuccessful) {
        return right(result.body!);
      } else {
        final ApiResponse response =
            ApiResponse.fromJson({"msg": result.error});
        return left(ServerFailure.apiFailure(msg: response.msg?['message']));
      }
    } catch (e) {
      return left(ServerFailure.serverError(msg: catchExceptions(result, e)));
    }
  }
}

//{"cod":401, "message": "Invalid API key. Please see https://openweathermap.org/faq#error401 for more info."}
