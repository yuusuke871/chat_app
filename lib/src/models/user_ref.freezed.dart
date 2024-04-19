// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRef {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userMail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRefCopyWith<UserRef> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRefCopyWith<$Res> {
  factory $UserRefCopyWith(UserRef value, $Res Function(UserRef) then) =
      _$UserRefCopyWithImpl<$Res, UserRef>;
  @useResult
  $Res call({String userId, String userName, String userMail});
}

/// @nodoc
class _$UserRefCopyWithImpl<$Res, $Val extends UserRef>
    implements $UserRefCopyWith<$Res> {
  _$UserRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userMail = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userMail: null == userMail
          ? _value.userMail
          : userMail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRefImplCopyWith<$Res> implements $UserRefCopyWith<$Res> {
  factory _$$UserRefImplCopyWith(
          _$UserRefImpl value, $Res Function(_$UserRefImpl) then) =
      __$$UserRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userName, String userMail});
}

/// @nodoc
class __$$UserRefImplCopyWithImpl<$Res>
    extends _$UserRefCopyWithImpl<$Res, _$UserRefImpl>
    implements _$$UserRefImplCopyWith<$Res> {
  __$$UserRefImplCopyWithImpl(
      _$UserRefImpl _value, $Res Function(_$UserRefImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userMail = null,
  }) {
    return _then(_$UserRefImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userMail: null == userMail
          ? _value.userMail
          : userMail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserRefImpl implements _UserRef {
  const _$UserRefImpl(
      {required this.userId, required this.userName, required this.userMail});

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userMail;

  @override
  String toString() {
    return 'UserRef(userId: $userId, userName: $userName, userMail: $userMail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRefImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userMail, userMail) ||
                other.userMail == userMail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, userMail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRefImplCopyWith<_$UserRefImpl> get copyWith =>
      __$$UserRefImplCopyWithImpl<_$UserRefImpl>(this, _$identity);
}

abstract class _UserRef implements UserRef {
  const factory _UserRef(
      {required final String userId,
      required final String userName,
      required final String userMail}) = _$UserRefImpl;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get userMail;
  @override
  @JsonKey(ignore: true)
  _$$UserRefImplCopyWith<_$UserRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
