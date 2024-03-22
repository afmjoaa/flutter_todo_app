part of 'todo_list_cubit.dart';

abstract class TodoListState extends Equatable {
  final List properties;
  final List<TodoModel> todos;

  const TodoListState(this.todos, [this.properties = const []]);

  @override
  List<Object> get props => [properties];

  @override
  bool get stringify => true;
}

class TodoListInitialState extends TodoListState {
  TodoListInitialState(super.dataContainer);
}

class TodoListUpdatedState extends TodoListState {
  TodoListUpdatedState(List<TodoModel> todos) : super(todos, [DateTime.now()]);
}



