import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testingdemo/feature/todo/app/state/todo_state.dart';
import 'package:testingdemo/feature/todo/domain/base/repository/todo_repository_base.dart';
import 'package:testingdemo/feature/todo/domain/base/usecase/todo_usecase_base.dart';

class TodoController extends StateNotifier<TodoState>
    implements TodoUsecaseBase {
  final TodoRepositoryBase _todoRepositoryBase;

  TodoController(this._todoRepositoryBase) : super(const TodoState.initial());

  @override
  Future<void> getTodo() async {
    state = const TodoState.loading();

    final result = await _todoRepositoryBase.fetchTodo();

    state = result.fold(
      (l) => TodoState.failure(l),
      (r) => TodoState.success(r),
    );
  }

  @override
  Future<void> getTodoFail() async {
    state = const TodoState.loading();

    final result = await _todoRepositoryBase.fetchTodoFails();

    state = result.fold(
      (l) => TodoState.failure(l),
      (r) => TodoState.success(r),
    );
  }
}
