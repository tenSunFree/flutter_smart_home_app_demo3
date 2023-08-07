// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$WeatherApiService extends WeatherApiService {
  _$WeatherApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = WeatherApiService;

  @override
  Future<Response<Map<String, dynamic>>> getCurrentWeather(
    double latitude,
    double longitude,
    String appId,
  ) {
    final Uri $url =
        Uri.parse('https://api.kcg.gov.tw/api/service/get/ad197194-6db9-4f14-ad38-2adceea831c3');
    final Map<String, dynamic> $params = <String, dynamic>{
      'lat': latitude,
      'lon': longitude,
      'appid': appId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
