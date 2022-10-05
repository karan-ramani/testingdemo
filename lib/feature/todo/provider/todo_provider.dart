import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testingdemo/feature/todo/app/controller/todo_controller.dart';
import 'package:testingdemo/feature/todo/app/state/todo_state.dart';
import 'package:testingdemo/feature/todo/domain/base/repository/todo_repository_base.dart';
import 'package:testingdemo/feature/todo/infra/repository/todo_repository.dart';

StateNotifierProvider<TodoController, TodoState> todoServiceProvider() {
  return _todoProvider;
}

final _todoRepositoryProvider = Provider<TodoRepositoryBase>(
  (ref) => TodoRepository(),
);

final _todoProvider = StateNotifierProvider<TodoController, TodoState>(
  (ref) => TodoController(
    ref.watch(_todoRepositoryProvider),
  ),
);
