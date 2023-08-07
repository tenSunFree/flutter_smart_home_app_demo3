import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_smart_home_app_demo3/domain/entities/device.dart';

part 'room.freezed.dart';

part 'room.g.dart';

@unfreezed
class Room with _$Room {
  factory Room(
      {String? roomId,
      required String name,
      required String image,
      required String subtitle,
      required bool isActive,
      List<Device>? devices}) = _Room;

  static const fromJsonFactory = _$RoomFromJson;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
