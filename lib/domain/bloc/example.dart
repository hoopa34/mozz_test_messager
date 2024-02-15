import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';

abstract class Example {
  static final MessengerItemType first = MessengerItemType(
    accountId: 0,
    accountName: 'Виктор Власов',
    isOnline: false,
    lastTimeOnline: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day - 1,
    ),
    allMessages: [
      MessageItemType(
        isUser: true,
        isWatched: false,
        messageDate: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          21,
          41,
        ),
        message: 'Уже сделал?',
      ),
      MessageItemType(
        isUser: false,
        isWatched: true,
        messageDate: DateTime(2022, 1, 27, 21, 41),
        message: 'Хорошо',
      ),
      MessageItemType(
        isUser: true,
        isWatched: true,
        messageDate: DateTime(2022, 1, 27, 21, 41),
        message: 'Сделай мне кофе, пожалуйста',
      ),
    ],
  );

  static final MessengerItemType second = MessengerItemType(
    accountId: 1,
    accountName: 'Саша Алексеев',
    isOnline: false,
    lastTimeOnline: DateTime(22, 1, 12),
    allMessages: [
      MessageItemType(
        isUser: true,
        isWatched: false,
        messageDate: DateTime(22, 1, 12, 12, 12),
        message: 'Я готов',
      ),
    ],
  );

  static final MessengerItemType third = MessengerItemType(
    accountId: 2,
    accountName: 'Пётр Жаринов',
    isOnline: false,
    lastTimeOnline: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute - 2,
    ),
    allMessages: [
      MessageItemType(
        isUser: true,
        isWatched: false,
        messageDate: DateTime(22, 1, 12, 12, 12),
        message: 'Я вышел',
      ),
    ],
  );

  static final MessengerItemType four = MessengerItemType(
    accountId: 3,
    accountName: 'Пётр Жаринов',
    isOnline: false,
    lastTimeOnline: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      9,
      23,
    ),
    allMessages: [
      MessageItemType(
        isUser: true,
        isWatched: false,
        messageDate: DateTime(22, 1, 12, 12, 12),
        message: 'Я вышел',
      ),
    ],
  );
}
