import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRepository {
  Future<void> addMessage(String roomId, String message) async {
    final db = FirebaseFirestore.instance;

    final mesData = <String, dynamic>{
      "message": message,
      "uid": FirebaseAuth.instance.currentUser?.uid,
      "createdAt": FieldValue.serverTimestamp(),
    };
    await db.collection('rooms').doc(roomId).collection('posts').add(mesData);

    final roomData = <String, dynamic>{
      "lastMessage": message,
      "updatedAt": FieldValue.serverTimestamp(),
    };
    await db.collection('rooms').doc(roomId).update(roomData);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchPost(String roomId) {
    final db = FirebaseFirestore.instance;
    return db
        .collection('rooms')
        .doc(roomId)
        .collection('posts')
        .orderBy('createdAt')
        .snapshots();
  }
}
