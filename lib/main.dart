import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mozz_test_messenger/domain/hive/hive_boxes.dart';
import 'package:mozz_test_messenger/domain/hive/hive_keys.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';
import 'package:mozz_test_messenger/ui/app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MessageItemTypeAdapter());
  Hive.registerAdapter(MessengerItemTypeAdapter());
  await Hive.openBox<MessengerItemType>(HiveKeys.messengerItemTypeKey);
  HiveBoxes.messengerItemType.clear();
  runApp(const App());
}