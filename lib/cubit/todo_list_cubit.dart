import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo_app/model/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit()
      : super(
          TodoListInitialState(
              [
                TodoModel('Complete the homework', false, 'Finish the math assignment due tomorrow.'),
                TodoModel('Clean the bedroom', false, 'Vacuum the floor and organize the closet.'),
                TodoModel('Wash the car', false, 'Take the car to the car wash and clean the interior.'),
                TodoModel('Do exercise (50 push-ups)', false, 'Complete 50 push-ups as part of daily workout routine.'),
                TodoModel('Take a bath', false, 'Relax with a warm bath after a long day.'),
                TodoModel('Get a haircut', false, 'Schedule an appointment at the barber for a trim.'),
                TodoModel('Feed your pet', false, 'Give your cat/dog their dinner.'),
                TodoModel('Take your medicine', false, 'Remember to take your prescribed medication.'),
              ]
          ),
        );

  void updateTodoListState(int index, TodoModel currentTodo) {
    state.todos[index] = currentTodo;
    emit(TodoListUpdatedState(state.todos));
  }

  void markTaskAsComplete(int index) {
    state.todos[index].isDone = true;
    emit(TodoListUpdatedState(state.todos));
  }

  void deleteTask(int index) {
    state.todos.removeAt(index);
    emit(TodoListUpdatedState(state.todos));
  }

  void addTask(TodoModel todoModel) {
    state.todos.add(todoModel);
    emit(TodoListUpdatedState(state.todos));
  }
}
