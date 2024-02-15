import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mozz_test_messenger/domain/hive/hive_keys.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';
import 'package:mozz_test_messenger/ui/app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MessengerItemTypeAdapter());
  await Hive.openBox<MessengerItemType>(HiveKeys.messengerItemTypeKey);
  runApp(const App());
}