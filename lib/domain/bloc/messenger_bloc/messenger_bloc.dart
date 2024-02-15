import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mozz_test_messenger/domain/bloc/example.dart';
import 'package:mozz_test_messenger/domain/hive/hive_boxes.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';

part 'messenger_event.dart';
part 'messenger_state.dart';

class MessengerBloc extends Bloc<MessengerEvent, MessengerState> {
  MessengerBloc() : super(MessengerInitial()) {
    on<MessengerLoadEvent>(_load);
    on<MessengerAddMessageEvent>(_addMessage);
  }

  Future<void> _load(
    MessengerLoadEvent event,
    Emitter<MessengerState> emit,
  ) async {
    try {
      MessengerLoaded account;
      if (HiveBoxes.messengerItemType.isNotEmpty) {
        account = MessengerLoaded(
          item: HiveBoxes.messengerItemType.values.toList()[event.accountId],
        );
      } else {
        HiveBoxes.messengerItemType.addAll({
          Example.first,
          Example.second,
          Example.third,
          Example.four,
        });

        account = MessengerLoaded(
          item: HiveBoxes.messengerItemType.values.toList()[event.accountId],
        );
      }
      emit(account);
    } catch (e) {
      e;
    }
  }

  Future<void> _addMessage(
    MessengerAddMessageEvent event,
    Emitter<MessengerState> emit,
  ) async {
    try {
      MessengerAddedNewMessage account;
      account = MessengerAddedNewMessage(
        item: HiveBoxes.messengerItemType.values.toList()[event.accountId],
      )..item.allMessages.insert(
            0,
            MessageItemType(
              isUser: true,
              isWatched: false,
              messageDate: DateTime.now(),
              message: event.message,
            ),
          );
      HiveBoxes.messengerItemType.putAt(event.accountId, account.item);
      emit(account);
    } catch (e) {
      e;
    }
  }
}
