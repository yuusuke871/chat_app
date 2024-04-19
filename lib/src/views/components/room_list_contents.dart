import 'package:chat_app/src/models/room.dart';
import 'package:chat_app/src/router/router_path.dart';
import 'package:chat_app/src/view_models/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RoomListContents extends ConsumerWidget {
  const RoomListContents({super.key, required this.rooms});

  final List<Room> rooms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 64,
          child: ListTile(
              leading: const CircleAvatar(
                radius: 32,
                backgroundImage: null,
              ),
              title: Text(rooms[index].userRef.userName),
              subtitle: Text(rooms[index].lastMessage),
              onTap: () {
                ref.read(roomIdProvider.notifier).state = rooms[index].roomId;

                context.pushNamed(
                  RouterPath.chat,
                  pathParameters: {
                    "dispNm": rooms[index].userRef.userName,
                  },
                );
              }),
        );
      },
    );
  }
}
