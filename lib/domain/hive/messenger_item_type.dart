import 'package:hive/hive.dart';

part 'messenger_item_type.g.dart';

@HiveType(typeId: 0)
class MessengerItemType{

  @HiveField(0)
  int accountId;

  @HiveField(1)
  String accountName;

  @HiveField(2)
  bool isOnline;

  @HiveField(3)
  DateTime lastTimeOnline;

  @HiveField(4)
  List<MessageItemType> allMessages;

  MessengerItemType({
    required this.accountId,
    required this.accountName,
    required this.isOnline,
    required this.lastTimeOnline,
    required this.allMessages,
  });

}

@HiveType(typeId: 1)
class MessageItemType{
  @HiveField(0)
  String message;
  @HiveField(1)
  bool isUser;
  @HiveField(2)
  bool isWatched;
  @HiveField(3)
  DateTime messageDate;

  MessageItemType({
    required this.isUser,
    required this.isWatched,
    required this.message,
    required this.messageDate,
  });
}