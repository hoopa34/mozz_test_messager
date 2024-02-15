import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mozz_test_messenger/domain/hive/hive_boxes.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitial()) {
    on<ContactsLoadEvent>(_load);
  }

  Future<void> _load(
    ContactsLoadEvent event,
    Emitter<ContactsState> emit,
  ) async {
    try {
      List<Contacts> rewriteList = [];
      if (HiveBoxes.messengerItemType.isNotEmpty) {
        List<MessengerItemType> list =
            HiveBoxes.messengerItemType.values.toList();

        for (var i = 0; i < list.length; i++) {
          Contacts item = Contacts(
            accountId: list[i].accountId,
            accountName: list[i].accountName,
            isOnline: list[i].isOnline,
            lastTimeOnline: list[i].lastTimeOnline,
            lastMessage: list[i].allMessages.first.message,
          );
          rewriteList.add(item);
        }
      } else {}
      emit(ContactsLoaded(allContacts: rewriteList));
    } catch (e) {
      print('Contacts bloc');
      print(e);
    }
  }
}
