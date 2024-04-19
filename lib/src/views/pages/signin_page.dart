import 'package:chat_app/src/repositories/user_repository.dart';
import 'package:chat_app/src/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_app/src/view_models/provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mailController = ref.watch(mailControllerProvider);
    final passController = ref.watch(passControllerProvider);
    final isObscure = ref.watch(obscureProvider);
    final errorText = ref.watch(errorTextProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
                width: 200,
                height: 200,
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.goNamed(RouterPath.forgetpass),
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final repository = UserRepository();
                    final errStr = await repository.signIn(
                      email: mailController.text,
                      password: passController.text,
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
                    }
                  },
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(height: 96),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    const Text("Don't you have an account?"),
                    TextButton(
                      onPressed: () => context.goNamed(RouterPath.signup),
                      child: const Text('Sign Up'),
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
