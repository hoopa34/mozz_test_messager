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

class MessageItemType{
  String message;
  bool isUser;
  bool isWatched;
  DateTime messageDate;

  MessageItemType({
    required this.isUser,
    required this.isWatched,
    required this.message,
    required this.messageDate,
  });
}