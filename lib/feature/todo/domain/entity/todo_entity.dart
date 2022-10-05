import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const TodoEntity._();

  const factory TodoEntity({
    required String uid,
    required String name,
  }) = _TodoEntity;
}
