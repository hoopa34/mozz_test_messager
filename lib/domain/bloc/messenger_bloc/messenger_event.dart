part of 'messenger_bloc.dart';

sealed class MessengerEvent extends Equatable {
  const MessengerEvent();

  @override
  List<Object> get props => [];
}

class MessengerLoadEvent extends MessengerEvent {
  final int accountId;
  const MessengerLoadEvent({required this.accountId});
}

class MessengerAddMessageEvent extends MessengerEvent {
  final String message;
  final int accountId;
  const MessengerAddMessageEvent({
    required this.accountId,
    required this.message,
  });
}

class MessengerAddAccountEvent extends MessengerEvent {
  const MessengerAddAccountEvent();
}

class MessengerEditAccountEvent extends MessengerEvent {
  const MessengerEditAccountEvent();
}
