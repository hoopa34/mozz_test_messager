part of 'messenger_bloc.dart';

sealed class MessengerState extends Equatable {
  const MessengerState();
  
  @override
  List<Object> get props => [];
}

final class MessengerInitial extends MessengerState {}

final class MessengerLoaded extends MessengerState{
  final MessengerItemType item;

  const MessengerLoaded({required this.item});

  @override
  List<Object> get props => [item];
}
