import 'package:chat_app/src/repositories/user_repository.dart';
import 'package:chat_app/src/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_app/src/view_models/provider.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mailController = ref.watch(mailControllerProvider);
    final passController = ref.watch(passControllerProvider);
    final nameController = ref.watch(nameControllerProvider);
    final isObscure = ref.watch(obscureProvider);
    final errorText = ref.watch(errorTextProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 100,
                  child: Text('プロフィール画像'),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: mailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passController,
                obscureText: isObscure,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () =>
                        ref.watch(obscureProvider.notifier).state = !isObscure,
                  ),
                ),
              ),
              Text(
                errorText,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final repository = UserRepository();
                    String errStr = await repository.signUp(
                      email: mailController.text,
                      password: passController.text,
                      name: nameController.text,
                    );

                    if (errStr.isEmpty) {
                      if (context.mounted) {
                        context.goNamed(RouterPath.top);
                      }
                    } else {
                      ref.watch(errorTextProvider.notifier).state = errStr;
                      ref.watch(mailTextProvider.notifier).state =
                          mailController.text;
                      ref.watch(passTextProvider.notifier).state =
                          passController.text;
                      ref.watch(nameTextProvider.notifier).state =
                          nameController.text;
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ),
              const SizedBox(height: 96),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () => context.goNamed(RouterPath.signin),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
