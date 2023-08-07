import 'package:flutter/material.dart';
import 'package:flutter_smart_home_app_demo3/utils/app_colors.dart';

import '../../utils/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingAll(5),
      child: const Center(
          child: CircularProgressIndicator(
        color: primaryColor,
        strokeWidth: 3.0,
      )),
    );
  }
}
