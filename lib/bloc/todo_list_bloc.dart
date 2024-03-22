import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo_app/model/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListInitialState(
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
  )) {

    on<UpdateTodoListEvent>((event, emit) {
      state.todos[event.index] = event.todoModel;
      emit(TodoListUpdatedState(state.todos));
    });

    on<MarkTodoAsCompleteEvent>((event, emit) {
      state.todos[event.index].isDone = true;
      emit(TodoListUpdatedState(state.todos));
    });

    on<DeleteTodoEvent>((event, emit) {
      state.todos.removeAt(event.index);
      emit(TodoListUpdatedState(state.todos));
    });

  }
}
