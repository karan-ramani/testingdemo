import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testingdemo/feature/todo/app/controller/todo_controller.dart';
import 'package:testingdemo/feature/todo/app/state/todo_state.dart';
import 'package:testingdemo/feature/todo/domain/base/repository/todo_repository_base.dart';
import 'package:testingdemo/feature/todo/domain/entity/todo_entity.dart';
import 'package:testingdemo/feature/todo/domain/failure/todo_failure.dart';
import 'package:testingdemo/feature/todo/infra/repository/todo_repository.dart';

import 'todo_controller_test.mocks.dart';

@GenerateMocks([TodoRepositoryBase])
void main() {
  // Create a repository provider
  final todoRepositoryProvider = Provider<TodoRepositoryBase>(
    (ref) => TodoRepository(),
  );

  // Create a mock StateNotifierProvider with SUT TodoController
  final sutTodoProvider = StateNotifierProvider<TodoController, TodoState>(
    (ref) => TodoController(
      ref.watch(todoRepositoryProvider),
    ),
  );

  // Create a container to invoke methods and read states
  final container = ProviderContainer();

  /// Create a mock container with override of repository (as an example)
  /// Create a mock repository provider
  final MockTodoRepositoryBase mockTodoRepository = MockTodoRepositoryBase();

  final mockContainer = ProviderContainer(
    overrides: [
      todoRepositoryProvider.overrideWithValue(mockTodoRepository),
    ],
  );

  group(
    'Todo Repository Tests without Fake/Mock',
    () {
      test(
        'Default First State should be Initial',
        () {
          // Read (access) system under test i.e. todoController
          expect(container.read(sutTodoProvider), isA<TodoState>());
          final result = container.read(sutTodoProvider);
          expect(result, const TodoState.initial());
        },
      );

      test(
        'fetchTodo should return success(todoEntity) with text hello world',
        () async {
          expect(container.read(sutTodoProvider), isA<TodoState>());
          container.read(sutTodoProvider.notifier).getTodo();
          // Check Loading State
          expect(container.read(sutTodoProvider), const TodoState.loading());

          await container.read(sutTodoProvider.notifier).getTodo();
          // Check Success State
          expect(
            container.read(sutTodoProvider),
            const TodoState.success(
              TodoEntity(uid: '1', name: 'Hello World'),
            ),
          );
        },
      );

      test(
        'fetchTodoFails should return failure(todoFailure.server) as it fails',
        () async {
          expect(container.read(sutTodoProvider), isA<TodoState>());
          container.read(sutTodoProvider.notifier).getTodoFail();
          // Check Loading State
          expect(container.read(sutTodoProvider), const TodoState.loading());

          await container.read(sutTodoProvider.notifier).getTodoFail();
          // Check Success State
          expect(
            container.read(sutTodoProvider),
            const TodoState.failure(TodoFailure.server('It Failed')),
          );
        },
      );
    },
  );

  group(
    'Todo Controller Tests with Fake/Mock',
    () {
      test(
        'Default First State should be Initial',
        () {
          // Read (access) system under test i.e. todoController
          expect(mockContainer.read(sutTodoProvider), isA<TodoState>());
          final result = mockContainer.read(sutTodoProvider);
          expect(result, const TodoState.initial());
        },
      );

      test(
        'fetchTodo should return success(todoEntity) with text hello world',
        () async {
          when(mockTodoRepository.fetchTodo()).thenAnswer(
            (realInvocation) async => Future.value(
              right(
                const TodoEntity(uid: '1', name: 'Fake Hello World'),
              ),
            ),
          );
          expect(mockContainer.read(sutTodoProvider), isA<TodoState>());
          mockContainer.read(sutTodoProvider.notifier).getTodo();
          // Check Loading State
          expect(
              mockContainer.read(sutTodoProvider), const TodoState.loading());

          await mockContainer.read(sutTodoProvider.notifier).getTodo();
          // Check Success State
          expect(
            mockContainer.read(sutTodoProvider),
            const TodoState.success(
              TodoEntity(uid: '1', name: 'Fake Hello World'),
            ),
          );
        },
      );

      test(
        'fetchTodoFails should return failure(todoFailure.server) as it fails',
        () async {
          when(mockTodoRepository.fetchTodoFails()).thenAnswer(
            (realInvocation) async => Future.value(
              left(
                const TodoFailure.server('Fake It Failed'),
              ),
            ),
          );
          expect(mockContainer.read(sutTodoProvider), isA<TodoState>());
          mockContainer.read(sutTodoProvider.notifier).getTodoFail();
          // Check Loading State
          expect(
              mockContainer.read(sutTodoProvider), const TodoState.loading());

          await mockContainer.read(sutTodoProvider.notifier).getTodoFail();
          // Check Success State
          expect(
            mockContainer.read(sutTodoProvider),
            const TodoState.failure(TodoFailure.server('Fake It Failed')),
          );
        },
      );
    },
  );
}
