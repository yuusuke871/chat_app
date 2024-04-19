import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/src/models/user_ref.dart';

class UserRepository {
  Future<List<UserRef>> fetchUserList() async {
    final db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final snapshot =
        await db.collection('users').where('uid', isNotEqualTo: uid).get();
    final docs = snapshot.docs;
    return docs.map((doc) => UserRef.fromMap(doc.data())).toList();
  }

  Future<String> signIn({required email, required password}) async {
    try {
      /// credential にはアカウント情報が記録される
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return '';
    }

    /// サインインに失敗した場合のエラー処理
    on FirebaseAuthException catch (e) {
      /// メールアドレスが無効の場合
      if (e.code == 'invalid-email') {
        return 'メールアドレスが無効です';
      }

      /// ユーザーが存在しない場合
      if (e.code == 'user-not-found') {
        return 'ユーザーが存在しません';
      }

      /// パスワードが間違っている場合
      if (e.code == 'wrong-password') {
        return 'パスワードが間違っています';
      }

      /// その他エラー
      return 'サインインエラー';
    }
  }

  Future<String> signUp(
      {required email, required password, required name}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final db = FirebaseFirestore.instance;
      final uid = credential.user?.uid;
      final user = <String, dynamic>{
        'uid': uid,
        'name': name,
        'email': email,
      };
      await db.collection('users').doc(uid).set(user);

      return '';
    }

    /// サインインに失敗した場合のエラー処理
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'パスワードが弱いです。';
      }
      if (e.code == 'email-already-in-use') {
        return '既にユーザが存在しています。';
      }

      /// その他エラー
      return 'サインインエラー';
    }
  }

  Future<void> passReset({required mail}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: mail);
    } catch (e) {
      //
    }
  }
}
