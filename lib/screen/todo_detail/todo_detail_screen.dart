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
  late TextEditingController titleEditingController;
  late TextEditingController descEditingController;


  @override
  void initState() {
    super.initState();
    titleEditingController = TextEditingController();
    descEditingController = TextEditingController();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              isAddNewTodo? 'Add new task' : 'Current task: ${todoListCubit.state.todos[widget.index].task} \nDescrition: ${todoListCubit.state.todos[widget.index].description}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: titleEditingController,
              decoration: InputDecoration(
                labelText: 'Todo Title',
                hintText: isAddNewTodo? 'Add new task title here...' : 'Update current task title here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: descEditingController,
              decoration: InputDecoration(
                labelText: 'Todo Description',
                hintText: isAddNewTodo? 'Add new task description here...' : 'Update current task description here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Confirm",
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        onPressed: () {
          if(isAddNewTodo) {
            _addTodo(todoListCubit);
          } else {
            _updateTodo(todoListCubit, context);
          }
        },
        child: const Icon(Icons.check_rounded),
      ),
    );
  }

  void _updateTodo(TodoListCubit todoListBloc, BuildContext context) {
    TodoModel currentTodo = todoListBloc.state.todos[widget.index];
    currentTodo.task = titleEditingController.text;
    currentTodo.description = descEditingController.text;
    todoListBloc.updateTodoListState(widget.index, currentTodo);
    Navigator.pop(context);
  }

  void _addTodo(TodoListCubit todoListBloc) {
    TodoModel currentTodo = TodoModel(titleEditingController.text, false, descEditingController.text);
    todoListBloc.addTask(currentTodo);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleEditingController.clear();
    descEditingController.clear();
    super.dispose();
  }
}

