import 'package:dartz/dartz.dart';
import 'package:testingdemo/feature/todo/domain/entity/todo_entity.dart';
import 'package:testingdemo/feature/todo/domain/failure/todo_failure.dart';

abstract class TodoRepositoryBase {
  Future<Either<TodoFailure, TodoEntity>> fetchTodo();
  Future<Either<TodoFailure, TodoEntity>> fetchTodoFails();
}
