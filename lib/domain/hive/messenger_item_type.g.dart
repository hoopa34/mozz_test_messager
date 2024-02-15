// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messenger_item_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageItemTypeAdapter extends TypeAdapter<MessageItemType> {
  @override
  final int typeId = 0;

  @override
  MessageItemType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageItemType(
      isUser: fields[1] as bool,
      isWatched: fields[2] as bool,
      message: fields[0] as String,
      messageDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MessageItemType obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.isUser)
      ..writeByte(2)
      ..write(obj.isWatched)
      ..writeByte(3)
      ..write(obj.messageDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessengerItemTypeAdapter extends TypeAdapter<MessengerItemType> {
  @override
  final int typeId = 1;

  @override
  MessengerItemType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessengerItemType(
      accountId: fields[0] as int,
      accountName: fields[1] as String,
      isOnline: fields[2] as bool,
      lastTimeOnline: fields[3] as DateTime,
      allMessages: (fields[4] as List).cast<MessageItemType>(),
    );
  }

  @override
  void write(BinaryWriter writer, MessengerItemType obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accountId)
      ..writeByte(1)
      ..write(obj.accountName)
      ..writeByte(2)
      ..write(obj.isOnline)
      ..writeByte(3)
      ..write(obj.lastTimeOnline)
      ..writeByte(4)
      ..write(obj.allMessages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessengerItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
