import 'package:flutter/material.dart';
import 'package:flutter_smart_home_app_demo3/utils/app_style.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: Center(
            child: Text(
      "Not yet implemented",
      style: TextStyles.nunitoSans,
    )));
  }
}
