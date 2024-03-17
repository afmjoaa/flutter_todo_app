part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  final List properties;

  TodoListEvent([this.properties = const []]);

  @override
  List<Object?> get props => [properties];

  @override
  bool get stringify => true;
}

class UpdateTodoListEvent extends TodoListEvent {
  final int index;
  final TodoModel todoModel;
  UpdateTodoListEvent(this.index, this.todoModel);

  @override
  List<Object?> get props => [index, todoModel];
}

class MarkTodoAsCompleteEvent extends TodoListEvent {
  final int index;
  MarkTodoAsCompleteEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class DeleteTodoEvent extends TodoListEvent {
  final int index;
  DeleteTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}

