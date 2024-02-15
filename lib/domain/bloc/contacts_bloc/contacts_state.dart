part of 'contacts_bloc.dart';

sealed class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

final class ContactsInitial extends ContactsState {}

final class ContactsLoaded extends ContactsState {
  final List<Contacts> allContacts;

  const ContactsLoaded({required this.allContacts});

  @override
  List<Object> get props => [allContacts];
}

final class Contacts {
  final int accountId;
  final String accountName;
  final bool isOnline;
  final DateTime lastTimeOnline;
  final String lastMessage;

  const Contacts({
    required this.accountId,
    required this.accountName,
    required this.isOnline,
    required this.lastTimeOnline,
    required this.lastMessage,
  });
}
