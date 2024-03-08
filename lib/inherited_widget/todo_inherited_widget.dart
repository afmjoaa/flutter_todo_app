import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/shared/todo_data_container.dart';

class TodoInheritedWidget extends InheritedWidget {
  TodoInheritedWidget({
    super.key,
    required super.child,
    required this.dataContainer,
    required this.todoStreamController,
  }){
    todoStreamController.sink.add(dataContainer.todos);
  }

  final TodoDataContainer dataContainer;
  final StreamController<List<Todos>> todoStreamController;

  updateTodoStreamController(int index, Todos todos) {
    dataContainer.todos[index] = todos;
    todoStreamController.sink.add(dataContainer.todos);
  }

  static TodoInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoInheritedWidget>();
  }

  static TodoInheritedWidget of(BuildContext context) {
    final TodoInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No TodoInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TodoInheritedWidget oldWidget) =>
      dataContainer != oldWidget.dataContainer;
}