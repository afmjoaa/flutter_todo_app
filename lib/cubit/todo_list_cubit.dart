import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo_app/shared/todo_data_container.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListInitialState(TodoDataContainer()));

  void updateTodoListState(int index, Todos currentTodo) {
    state.dataContainer.todos[index] = currentTodo;
    emit(TodoListUpdatedState(state.dataContainer));
  }

  void markTaskAsComplete(int index) {
    state.dataContainer.todos[index].isDone = true;
    emit(TodoListUpdatedState(state.dataContainer));
  }

  void deleteTask(int index) {
    state.dataContainer.todos.removeAt(index);
    emit(TodoListUpdatedState(state.dataContainer));
  }
}
