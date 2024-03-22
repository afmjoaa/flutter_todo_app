import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';
import 'package:flutter_todo_app/model/todo_model.dart';
import 'package:flutter_todo_app/widget/common_appbar_widget.dart';

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
    final TodoListCubit todoListCubit = BlocProvider.of<TodoListCubit>(context);
    final bool isAddNewTodo = widget.index == -1 ? true: false;

    return Scaffold(
      appBar: CommonAppBarWidget(
        title: 'Todo detail screen',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              isAddNewTodo? 'Add new task' : 'Current task: ${todoListCubit.state.todos[widget.index].task}',
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
                _addTodo(todoListCubit);
              } else {
                _updateTodo(todoListCubit, context);
              }
            },
            child: Text("Confirm Edit"),
            style: ElevatedButton.styleFrom(
            ),
          )
        ],
      ),
    );
  }

  void _updateTodo(TodoListCubit todoListBloc, BuildContext context) {
    TodoModel currentTodo = todoListBloc.state.todos[widget.index];
    currentTodo.task = editingController.text;
    todoListBloc.updateTodoListState(widget.index, currentTodo);
    // todoListBloc.add(UpdateTodoListEvent(widget.index, currentTodo));
    Navigator.pop(context);
  }

  void _addTodo(TodoListCubit todoListBloc) {
    TodoModel currentTodo = TodoModel(editingController.text, false);
    todoListBloc.addTask(currentTodo);
    // todoListBloc.add(AddNewTodoEvent(currentTodo));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    editingController.clear();
    super.dispose();
  }
}

