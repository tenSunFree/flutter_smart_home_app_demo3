import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/weather/weather_bloc.dart';
import '../../utils/size_config.dart';
import '../schedule/schedule_screen.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int navBarIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const ScheduleScreen(),
    const HomeScreen(),
  ];

  WeatherBloc? weatherBloc;

  @override
  void initState() {
    super.initState();
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc?.add(const GetCurrentWeather("0", 0, 0));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: HomeScreen());
  }

  void _onPressed(int index) {
    setState(() {
      navBarIndex = index;
    });
  }
}
