import 'package:flutter/material.dart';
import 'package:flutter_smart_home_app_demo3/data/schedules_data.dart';
import 'package:flutter_smart_home_app_demo3/utils/constants.dart';

import 'schedule_item.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: paddingAll(10),
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: schedulesList.length,
                itemBuilder: (context, index) => ScheduleItem(
                      item: schedulesList[index],
                      onSwitch: () {},
                    ))));
  }
}
