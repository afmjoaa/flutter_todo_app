import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/bloc/todo_list_bloc.dart';

// import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';
import 'package:flutter_todo_app/screen/todo_detail/todo_detail_screen.dart';

class TodoListScreen extends StatefulWidget {
  static const String path = '/todo_list';

  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  @override
  void initState() {
    super.initState();
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade600,
        title: const Text(
          'Todo list screen',
          style: TextStyle(color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
      ),
      body: BlocListener<TodoListBloc, TodoListState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Todo List Updated"),
                backgroundColor: getRandomColor(),
                duration: Duration(milliseconds: 800),
              ),);
        },
        child: BlocBuilder<TodoListBloc, TodoListState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      state.todos[index].task,
                      style: TextStyle(
                          decoration: state.todos![index].isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state.todos[index].isDone)
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<TodoListBloc>(context).add(
                                DeleteTodoEvent(index));
                          },
                          icon: Icon(Icons.delete),
                        ),
                      if (!state.todos[index].isDone)
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<TodoListBloc>(context).add(
                                MarkTodoAsCompleteEvent(index));
                          },
                          icon: Icon(Icons.check),
                        ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, TodoDetailScreen.path,
                              arguments: index);
                        },
                        icon: Icon(Icons.edit),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
