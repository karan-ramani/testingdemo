import 'package:dartz/dartz.dart';
import 'package:testingdemo/feature/todo/domain/base/repository/todo_repository_base.dart';
import 'package:testingdemo/feature/todo/domain/entity/todo_entity.dart';
import 'package:testingdemo/feature/todo/domain/failure/todo_failure.dart';

class TodoRepository implements TodoRepositoryBase {
  @override
  Future<Either<TodoFailure, TodoEntity>> fetchTodo() async {
    return const Right(TodoEntity(uid: '1', name: 'Hello World'));
  }

  @override
  Future<Either<TodoFailure, TodoEntity>> fetchTodoFails() async {
    return const Left(TodoFailure.server('It Failed'));
  }
}
