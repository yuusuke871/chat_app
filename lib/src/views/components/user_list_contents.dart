import 'package:chat_app/src/models/user_ref.dart';
import 'package:chat_app/src/repositories/room_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserListContents extends StatelessWidget {
  const UserListContents({super.key, required this.users});

  final List<UserRef> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return SizedBox(
          height: 64,
          child: ListTile(
            leading: const CircleAvatar(
              radius: 32,
              backgroundImage: null,
            ),
            title: Text(user.userName),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('roomを作成しますか？'),
                    actions: [
                      GestureDetector(
                        child: const Text('No'),
                        onTap: () => context.pop(),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        child: const Text('Yes'),
                        onTap: () async {
                          final repository = RoomRepository();
                          await repository.addRoom(user);

                          const snackBar = SnackBar(
                            content: Text('room作成が完了しました'),
                            duration: Duration(seconds: 3),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            context.pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
