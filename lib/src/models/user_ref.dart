import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ref.freezed.dart';

@freezed
class UserRef with _$UserRef {
  const factory UserRef({
    required String userId,
    required String userName,
    required String userMail,
  }) = _UserRef;

  factory UserRef.fromMap(Map<String, dynamic> data) {
    return UserRef(
      userId: data['uid'],
      userName: data['name'],
      userMail: data['email'],
    );
  }
}
