import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mozz_test_messenger/domain/hive/hive_boxes.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';

part 'messenger_event.dart';
part 'messenger_state.dart';

class MessengerBloc extends Bloc<MessengerEvent, MessengerState> {
  MessengerBloc() : super(MessengerInitial()) {
    on<MessengerLoadEvent>(_load);
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
        MessengerItemType bot = MessengerItemType(
          accountId: 0,
          accountName: 'Favorite Bot!',
          isOnline: true,
          lastTimeOnline: DateTime.now(),
          allMessages: [
            MessageItemType(
              isUser: false,
              isWatched: true,
              messageDate: DateTime.now(),
              message: 'Привет! Я простенький бот для симуляции!',
            ),
          ],
        );
        account = MessengerLoaded(item: bot);
        HiveBoxes.messengerItemType.add(bot);
      }
      emit(account);
    } catch (e) {
      print('Messenger bloc');
      print(e);
    }
  }
}
