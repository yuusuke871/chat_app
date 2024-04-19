import 'package:chat_app/src/repositories/chat_repository.dart';
import 'package:chat_app/src/view_models/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key, required this.dispNm});

  final String dispNm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    final controller = ref.watch(chatControllerProvider);
    final roomId = ref.watch(roomIdProvider);
    final messages = ref.watch(messagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(dispNm),
        backgroundColor: Colors.blue.shade200,
      ),
      body: messages.when(
        error: (error, _) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (snapshot) {
          return Container(
            color: Colors.blue.shade200,
            child: Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.docs[index];
                    return Container(
                      padding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Align(
                        alignment: data['uid'] != uid
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: data['uid'] != uid
                                ? Colors.white
                                : Colors.green.shade100,
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            data['message'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 16,
                      bottom: 32,
                      top: 16,
                    ),
                    height: 80,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () async {
                            final repository = ChatRepository();
                            await repository.addMessage(
                              roomId,
                              controller.text,
                            );
                            controller.clear();
                            ref.invalidate(roomListProvider);
                          },
                          icon: const Icon(Icons.send),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
