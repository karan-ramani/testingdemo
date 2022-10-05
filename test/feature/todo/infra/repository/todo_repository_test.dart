import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testingdemo/feature/todo/infra/repository/todo_repository.dart';

void main() {
  final sutTodoRepository = TodoRepository();

  group(
    'Todo Repository Tests',
    () {
      test(
        'fetchTodo should return right(todoEntity) with text hello world',
        () async {
          final result = await sutTodoRepository.fetchTodo();
          expectLater(result, isA<Right>());
        },
      );

      test(
        'fetchTodoFails should return left(todoFailure.server) as it fails',
        () async {
          final result = await sutTodoRepository.fetchTodoFails();
          expectLater(result, isA<Left>());
        },
      );
    },
  );
}
