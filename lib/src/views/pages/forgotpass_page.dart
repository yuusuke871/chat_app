import 'package:chat_app/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/src/view_models/provider.dart';

class ForgotPassPage extends ConsumerWidget {
  const ForgotPassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mailController = ref.watch(mailControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("パスワード再設定"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 120),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "メールアドレスを入力してください",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: mailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () async {
                  final repository = UserRepository();
                  await repository.passReset(mail: mailController.text);
                },
                child: const Text("Send mail"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
