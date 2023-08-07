import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_smart_home_app_demo3/domain/weather/i_weather_facade.dart';
import '../../domain/core/failures.dart';

part 'weather_bloc.freezed.dart';

part 'weather_event.dart';

part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherFacade weatherFacade;

  WeatherBloc(this.weatherFacade) : super(WeatherState.initial()) {
    on<GetCurrentWeather>(_onGetCurrentWeather);
  }

  void _onGetCurrentWeather(
      GetCurrentWeather event, Emitter<WeatherState> emit) async {
    debugPrint('WeatherBloc, _onGetCurrentWeather');
    Either<ServerFailure, Map<String, dynamic>> failureOrSuccess;
    emit(state.copyWith(status: WeatherStatus.loading, data: {}));
    failureOrSuccess = await weatherFacade.getCurrentWeather(
        event.appId, event.lat, event.long);

    failureOrSuccess.fold(
      (l) => l.map(
          serverError: (e) => emit(state.copyWith(
              errorMessage: e.msg, status: WeatherStatus.failure)),
          apiFailure: (e) => emit(state.copyWith(
              errorMessage: e.msg, status: WeatherStatus.failure))),
      (r) => {
        debugPrint('WeatherBloc, _onGetCurrentWeather, r: ${r}'),
        emit(
          state.copyWith(data: r, status: WeatherStatus.success),
        ),
      },
    );
  }
}
