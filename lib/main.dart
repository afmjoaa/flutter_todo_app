import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/core/app_routes.dart';
import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';
import 'package:flutter_todo_app/screen/home/home_screen.dart';
import 'package:flutter_todo_app/theme/theme_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListCubit>(
          create: (BuildContext context) => TodoListCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Flutter Todo App',
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.configureRoutes(),
            theme: themeState.themeData,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
