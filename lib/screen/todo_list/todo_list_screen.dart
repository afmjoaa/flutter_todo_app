import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';

// import 'package:flutter_todo_app/bloc/todo_list_bloc.dart';
import 'package:flutter_todo_app/screen/todo_detail/todo_detail_screen.dart';
import 'package:flutter_todo_app/widget/common_appbar_widget.dart';

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
    final TodoListCubit todoListCubit = BlocProvider.of<TodoListCubit>(context);
    // final TodoListBloc todoListBloc = BlocProvider.of<TodoListBloc>(context);
    return Scaffold(
      appBar: CommonAppBarWidget(
         title: 'Todo list screen',
      ),
      body: BlocListener<TodoListCubit, TodoListState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Todo List Updated'),
            duration: Duration(milliseconds: 2000),
            backgroundColor: getRandomColor(),
          ));
        },
        child: BlocBuilder<TodoListCubit, TodoListState>(
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
                          decoration: state.todos[index].isDone
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
                      state.todos[index].isDone
                          ? IconButton(
                        onPressed: () {
                          // todoListBloc.add(DeleteTodoEvent(index));
                          todoListCubit.deleteTask(index);
                          // _deleteTask(index, state.dataContainer.todos, todoListCubit);
                        },
                        icon: Icon(Icons.delete),
                      )
                          : IconButton(
                        onPressed: () {
                          // todoListBloc.add(MarkTodoAsCompleteEvent(index));
                          todoListCubit.markTaskAsComplete(index);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, TodoDetailScreen.path, arguments: -1);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
