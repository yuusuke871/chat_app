import 'package:chat_app/src/models/room.dart';
import 'package:chat_app/src/models/user_ref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoomRepository {
  final db = FirebaseFirestore.instance;

  Stream<List<Room>> fetchRoomList() async* {
    List<Room> roomList = [];

    final memberRef = await db
        .collection('rooms')
        .where('members', arrayContains: FirebaseAuth.instance.currentUser?.uid)
        .get();

    for (final data in memberRef.docs) {
      final doc = data.data();

      List members = doc['members'];
      members.remove(FirebaseAuth.instance.currentUser?.uid);

      final userDoc =
          await db.collection('users').doc(members.first.toString()).get();

      final userRef = UserRef.fromMap(userDoc.data()!);

      final room = Room(
        roomId: data.id,
        userRef: userRef,
        lastMessage: doc['lastMessage'],
      );

      roomList.add(room);
    }

    yield roomList;
  }

  Future<void> addRoom(UserRef user) async {
    final room = <String, dynamic>{
      'members': [
        FirebaseAuth.instance.currentUser?.uid,
        user.userId,
      ],
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'lastMessage': 'room作成'
    };
    await db.collection('rooms').add(room);
  }
}
