import 'package:chat_app/src/views/components/user_list_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/src/view_models/provider.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('user 一覧'),
      ),
      body: userList.when(
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (users) => UserListContents(users: users),
      ),
    );
  }
}
