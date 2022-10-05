// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoEntity {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoEntityCopyWith<TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEntityCopyWith<$Res> {
  factory $TodoEntityCopyWith(
          TodoEntity value, $Res Function(TodoEntity) then) =
      _$TodoEntityCopyWithImpl<$Res>;
  $Res call({String uid, String name});
}

/// @nodoc
class _$TodoEntityCopyWithImpl<$Res> implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._value, this._then);

  final TodoEntity _value;
  // ignore: unused_field
  final $Res Function(TodoEntity) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoEntityCopyWith<$Res>
    implements $TodoEntityCopyWith<$Res> {
  factory _$$_TodoEntityCopyWith(
          _$_TodoEntity value, $Res Function(_$_TodoEntity) then) =
      __$$_TodoEntityCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String name});
}

/// @nodoc
class __$$_TodoEntityCopyWithImpl<$Res> extends _$TodoEntityCopyWithImpl<$Res>
    implements _$$_TodoEntityCopyWith<$Res> {
  __$$_TodoEntityCopyWithImpl(
      _$_TodoEntity _value, $Res Function(_$_TodoEntity) _then)
      : super(_value, (v) => _then(v as _$_TodoEntity));

  @override
  _$_TodoEntity get _value => super._value as _$_TodoEntity;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_TodoEntity(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TodoEntity extends _TodoEntity with DiagnosticableTreeMixin {
  const _$_TodoEntity({required this.uid, required this.name}) : super._();

  @override
  final String uid;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoEntity(uid: $uid, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoEntity'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoEntity &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_TodoEntityCopyWith<_$_TodoEntity> get copyWith =>
      __$$_TodoEntityCopyWithImpl<_$_TodoEntity>(this, _$identity);
}

abstract class _TodoEntity extends TodoEntity {
  const factory _TodoEntity(
      {required final String uid, required final String name}) = _$_TodoEntity;
  const _TodoEntity._() : super._();

  @override
  String get uid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TodoEntityCopyWith<_$_TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
