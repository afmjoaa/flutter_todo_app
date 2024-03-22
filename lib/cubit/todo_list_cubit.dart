import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo_app/model/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListInitialState(
     [
      TodoModel('Complete the homework', false),
      TodoModel('Clean the bedroom', false),
      TodoModel('Wash the car', false),
      TodoModel('Do exercise(50 push-up)', false),
      TodoModel('Take a bath', false),
      TodoModel('Cut you hair', false),
      TodoModel('Feed your pet', false),
      TodoModel('Take your medicine', false),
      ]
  ));

  void markTaskAsComplete(int index) {
    state.todos[index].isDone = true;
    emit(TodoListUpdatedState(state.todos));
  }

  void deleteTask(int index) {
    state.todos.removeAt(index);
    emit(TodoListUpdatedState(state.todos));
  }

  void updateTask(int index, TodoModel todos) {
    state.todos[index] = todos;
    emit(TodoListUpdatedState(state.todos));
  }
}


