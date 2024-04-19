import 'package:chat_app/src/repositories/chat_repository.dart';
import 'package:chat_app/src/repositories/room_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/src/repositories/user_repository.dart';

final mailTextProvider = StateProvider((ref) => '');
final passTextProvider = StateProvider((ref) => '');
final nameTextProvider = StateProvider((ref) => '');

final mailControllerProvider = StateProvider.autoDispose((ref) {
  final mailText = ref.watch(mailTextProvider);
  return TextEditingController(text: mailText);
});

final passControllerProvider = StateProvider.autoDispose((ref) {
  final passText = ref.watch(passTextProvider);
  return TextEditingController(text: passText);
});

final nameControllerProvider = StateProvider.autoDispose((ref) {
  final nameText = ref.watch(nameTextProvider);
  return TextEditingController(text: nameText);
});

final obscureProvider = StateProvider((ref) => true);
final errorTextProvider = StateProvider((ref) => '');

final userListProvider = FutureProvider((ref) async {
  final repository = UserRepository();
  final userList = await repository.fetchUserList();
  return userList;
});

final roomListProvider = StreamProvider((ref) {
  final repository = RoomRepository();
  final roomList = repository.fetchRoomList();
  return roomList;
});

final roomIdProvider = StateProvider((ref) => '');

final chatControllerProvider = Provider.autoDispose(
  (ref) => TextEditingController(),
);

final messagesProvider = StreamProvider((ref) {
  final roomId = ref.watch(roomIdProvider);
  final repository = ChatRepository();
  return repository.fetchPost(roomId);
});
