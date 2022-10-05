import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testingdemo/feature/todo/domain/entity/todo_entity.dart';
import 'package:testingdemo/feature/todo/domain/failure/todo_failure.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const TodoState._();

  const factory TodoState.initial() = _Initial;

  const factory TodoState.loading() = _Loading;

  const factory TodoState.success(TodoEntity todoEntity) = _Success;

  const factory TodoState.failure(TodoFailure todoFailure) = _Failure;
}
