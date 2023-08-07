import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_home_app_demo3/data/devices_data.dart';
import 'package:flutter_smart_home_app_demo3/presentation/home/components/device_item.dart';

import '../../../data/rooms_data.dart';
import '../../../domain/entities/case_response.dart';
import '../../behaviors/over_scroll_behavior.dart';
import 'empty_device.dart';
import 'room_item.dart';

const deviceKey = Key("device");

class CustomGridView extends StatelessWidget {
  final CaseResponse response;

  const CustomGridView(this.response, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        itemCount: response.data?.length ?? 0,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(width: 1.5, color: Colors.black.withOpacity(0.4)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(response.data?[index].companyName ?? "No name"),
              ],
            ),
          );

          return key == deviceKey && index == devicesList.length - 1
              ? const EmptyItem(
                  key: Key("device"),
                )
              : key == deviceKey && index != devicesList.length
                  ? DeviceItem(device: devicesList[index])
                  : key != deviceKey && index == roomsList.length - 1
                      ? const EmptyItem(
                          key: Key("room"),
                        )
                      : key != deviceKey && index != roomsList.length
                          ? RoomItem(room: roomsList[index])
                          : const SizedBox.shrink();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
      ),
    );

    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      itemCount: response.data?.length ?? 0,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(width: 1.5, color: Colors.black.withOpacity(0.4)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(response.data?[index].companyName ?? "No name"),
            ],
          ),
        );

        return key == deviceKey && index == devicesList.length - 1
            ? const EmptyItem(
                key: Key("device"),
              )
            : key == deviceKey && index != devicesList.length
                ? DeviceItem(device: devicesList[index])
                : key != deviceKey && index == roomsList.length - 1
                    ? const EmptyItem(
                        key: Key("room"),
                      )
                    : key != deviceKey && index != roomsList.length
                        ? RoomItem(room: roomsList[index])
                        : const SizedBox.shrink();
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
    );
  }
}
