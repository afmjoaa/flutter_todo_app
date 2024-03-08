import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/core/app_routes.dart';
import 'package:flutter_todo_app/inherited_widget/todo_inherited_widget.dart';
import 'package:flutter_todo_app/shared/todo_data_container.dart';

import 'screen/todo_list/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamController<List<Todos>> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    return TodoInheritedWidget(
      dataContainer: TodoDataContainer(),
      todoStreamController: _streamController,
      child: MaterialApp(
        title: 'Flutter Todo App',
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.configureRoutes(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoListScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}