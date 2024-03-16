import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/core/app_routes.dart';
import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';

import 'screen/todo_list/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListCubit(),
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
}
