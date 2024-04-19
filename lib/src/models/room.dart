import 'package:chat_app/src/models/user_ref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required String roomId,
    required UserRef userRef,
    required String lastMessage,
  }) = _Room;
}
