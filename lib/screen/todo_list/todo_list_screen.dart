import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/inherited_widget/todo_inherited_widget.dart';
import 'package:flutter_todo_app/screen/todo_detail/todo_detail_screen.dart';
import 'package:flutter_todo_app/shared/todo_data_container.dart';

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
      body: StreamBuilder<List<Todos>>(
        stream: TodoInheritedWidget.of(context).todoStreamController.stream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    snapshot.data![index].task,
                    style: TextStyle(
                        decoration: snapshot.data![index].isDone
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
                    if (snapshot.data![index].isDone)
                      IconButton(
                        onPressed: () {
                          _deleteTask(index, snapshot.data!);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    if (!snapshot.data![index].isDone)
                      IconButton(
                        onPressed: () {
                          _markTaskAsComplete(index, snapshot.data!);
                        },
                        icon: Icon(Icons.check),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, TodoDetailScreen.path, arguments: index);
                      },
                      icon: Icon(Icons.edit),
                    )
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }

  void _markTaskAsComplete(int index, List<Todos> todos) {
    todos[index].isDone = true;
    TodoInheritedWidget.of(context).todoStreamController.sink.add(todos);
  }

  void _deleteTask(int index, List<Todos> todos) {
    todos.removeAt(index);
    TodoInheritedWidget.of(context).todoStreamController.sink.add(todos);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
