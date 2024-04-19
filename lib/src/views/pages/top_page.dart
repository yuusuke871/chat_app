import 'package:chat_app/src/views/pages/account_page.dart';
import 'package:chat_app/src/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  static const _screens = [HomePage(), AccountPage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      body: _screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
        ],
        onTap: (value) =>
            ref.watch(selectedIndexProvider.notifier).state = value,
      ),
    );
  }
}
