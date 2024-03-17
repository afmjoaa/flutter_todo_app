import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/bloc/todo_list_bloc.dart';
// import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';
import 'package:flutter_todo_app/model/todo_model.dart';

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
    // final TodoListCubit todoListCubit = BlocProvider.of<TodoListCubit>(context);
    final TodoListBloc todoListBloc = BlocProvider.of<TodoListBloc>(context);
    final bool isAddNewTodo = widget.index == -1 ? true: false;

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
              isAddNewTodo? 'Add new task' : 'Current task: ${todoListBloc.state.todos[widget.index].task}',
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
                labelText: 'Todo',
                hintText: isAddNewTodo? 'Add new task here...' : 'Write the updated task here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(isAddNewTodo) {
                _addTodo(todoListBloc);
              } else {
                _updateTodo(todoListBloc, context);
              }
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

  void _updateTodo(TodoListBloc todoListBloc, BuildContext context) {
    TodoModel currentTodo = todoListBloc.state.todos[widget.index];
    currentTodo.task = editingController.text;
    todoListBloc.add(UpdateTodoListEvent(widget.index, currentTodo));
    Navigator.pop(context);
  }

  void _addTodo(TodoListBloc todoListBloc) {
    TodoModel currentTodo = TodoModel(editingController.text, false);
    todoListBloc.add(AddNewTodoEvent(currentTodo));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    editingController.clear();
    super.dispose();
  }
}

