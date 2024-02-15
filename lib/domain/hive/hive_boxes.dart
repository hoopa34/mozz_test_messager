import 'package:hive/hive.dart';
import 'package:mozz_test_messenger/domain/hive/hive_keys.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';

class HiveBoxes{
  static Box<MessengerItemType> messengerItemType = Hive.box<MessengerItemType>(HiveKeys.messengerItemTypeKey);
}