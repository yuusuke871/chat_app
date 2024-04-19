import 'package:chat_app/src/router/router_path.dart';
import 'package:chat_app/src/view_models/provider.dart';
import 'package:chat_app/src/views/components/room_list_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomList = ref.watch(roomListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('room 一覧'),
      ),
      body: roomList.when(
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (rooms) => RoomListContents(rooms: rooms),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
          onPressed: () async {
            await context.pushNamed(RouterPath.userlist);
            ref.invalidate(roomListProvider);
          },
          child: const Row(
            children: [
              Icon(Icons.add),
              SizedBox(width: 8),
              Text('room 追加'),
            ],
          ),
        ),
      ),
    );
  }
}
