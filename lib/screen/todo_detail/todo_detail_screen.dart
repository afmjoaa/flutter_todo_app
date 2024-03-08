import 'package:flutter/material.dart';
import 'package:flutter_todo_app/inherited_widget/todo_inherited_widget.dart';
import 'package:flutter_todo_app/shared/todo_data_container.dart';

class TodoDetailScreen extends StatefulWidget {
  static const String path = '/todo_detail';

  final int index;

  const TodoDetailScreen({super.key, required this.index});

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  late TextEditingController editingController;


  @override
  void initState() {
    super.initState();
    editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    List<Todos> todos = TodoInheritedWidget
        .of(context)
        .dataContainer
        .todos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        title: const Text(
          'Todo detail screen',
          style: TextStyle(color: Colors.black),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Current task: ${todos[widget.index].task}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                labelText: 'Task',
                hintText: 'Write the updated task here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Todos currentTodo = todos[widget.index];
              currentTodo.task = editingController.text;
              TodoInheritedWidget.of(context).updateTodoStreamController(widget.index, currentTodo);
              Navigator.pop(context);
            },
            child: Text("Confirm Edit"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade400,
                foregroundColor: Colors.white
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    editingController.clear();
    super.dispose();
  }
}

