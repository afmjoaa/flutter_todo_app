import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/bloc/todo_list_bloc.dart';
import 'package:flutter_todo_app/core/app_routes.dart';
// import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';
import 'package:flutter_todo_app/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final StreamController<List<TodoModel>> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListBloc(),
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