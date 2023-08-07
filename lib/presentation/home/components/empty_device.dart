import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_home_app_demo3/presentation/home/components/custom_grid_view.dart';

import 'add_button.dart';

class EmptyItem extends StatelessWidget {
  const EmptyItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = key == deviceKey ? "device" : "room";
    return GestureDetector(
        onTap: () {
          name == "device"
              ? Navigator.pushNamed(context, "/add_new_device")
              : Navigator.pushNamed(context, "/add_new_room");
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1.5, color: Colors.black.withOpacity(0.4))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText("Add a new $name"),
                const SizedBox(
                  height: 10,
                ),
                const CustomAddButton()
              ],
            )));
  }
}
