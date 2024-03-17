part of 'todo_list_bloc.dart';

abstract class TodoListState extends Equatable {
  final List properties;
  final List<TodoModel> todos;

  const TodoListState(this.todos, [this.properties = const []]);

  @override
  List<Object?> get props => [properties];

  @override
  bool get stringify => true;
}

class TodoListInitialState extends TodoListState {
  const TodoListInitialState(super.todos);
}

class TodoListUpdatedState extends TodoListState {
  TodoListUpdatedState(List<TodoModel> todos): super(todos, [DateTime.now()]);
}