import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screen/todo_detail/todo_detail_screen.dart';
import 'package:flutter_todo_app/screen/todo_list/todo_list_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> configureRoutes() {
    return {
      TodoListScreen.path: (context) => const TodoListScreen(),
      TodoDetailScreen.path: (context) {
        final int index = ModalRoute.of(context)?.settings.arguments as int;
        return TodoDetailScreen(index: index);
      }
    };
  }
}