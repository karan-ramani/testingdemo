import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testingdemo/feature/todo/provider/todo_provider.dart';

Widget todoWidget(WidgetRef ref) {
  final todoService = ref.watch(todoServiceProvider());
  final todoController = ref.read(todoServiceProvider().notifier);

  return SafeArea(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Todo Value - '),
          Text(
            todoService.map(
              initial: (_) => 'Initial',
              loading: (_) => 'Loading',
              success: (_) => _.todoEntity.name,
              failure: (_) => _.todoFailure.message.toString(),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          IconButton(
            onPressed: () {
              todoController.getTodo();
            },
            icon: const Icon(Icons.forward),
          ),
          const SizedBox(
            height: 9.0,
          ),
          IconButton(
            onPressed: () {
              todoController.getTodoFail();
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    ),
  );
}
