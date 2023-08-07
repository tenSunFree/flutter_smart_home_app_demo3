import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_smart_home_app_demo3/presentation/home/components/custom_header.dart';
import 'package:flutter_smart_home_app_demo3/presentation/widgets/loading_widget.dart';
import 'package:flutter_smart_home_app_demo3/utils/app_colors.dart';

import '../../../application/weather/weather_bloc.dart';
import '../../../config/api_key.dart';
import '../../../domain/entities/case_response.dart';
import '../../../utils/app_style.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import 'custom_grid_view.dart';
import 'temperature_humidity_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  TabController? tabController;
  Position? position;
  WeatherBloc? weatherBloc;
  String errorMessage = '';

  @override
  void initState() {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    // getCurrentPosition();
    // tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void getCurrentPosition() async {
    await Geolocator.requestPermission();
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {});
      onRefresh();
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Padding(
        padding: paddingAll(0),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            debugPrint('_BodyState, build, state: $state');
            var response = CaseResponse.fromJson(state.data);
            debugPrint('_BodyState, build, response: ${response.data?.length}');
            return Row(
              children: [
                const Spacer(flex: 52),
                Expanded(
                  flex: 148,
                  child: Column(
                    children: [
                      const Spacer(flex: 31),
                      Expanded(
                        flex: 248,
                        child: Container(
                          color: Colors.transparent,
                          child: CustomGridView(
                            response,
                            key: Key("device"),
                          ),
                        ),
                      ),
                      const Spacer(flex: 21),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void onRefresh() {
    if (position != null) {
      weatherBloc!.add(GetCurrentWeather(
          APIKeys.openWeatherAPIKey, position!.latitude, position!.longitude));
    }
  }
}
