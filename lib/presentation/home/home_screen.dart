import 'package:flutter/material.dart';
import 'package:flutter_smart_home_app_demo3/presentation/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/icon_home.png',
            height: double.infinity,
            width:  double.infinity,
            fit: BoxFit.fill,
          ),
          Body(),
        ],
      ),
    );
  }
}
