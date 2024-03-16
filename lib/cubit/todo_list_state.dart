part of 'todo_list_cubit.dart';

abstract class TodoListState extends Equatable {
  final List properties;
  final TodoDataContainer dataContainer;

  const TodoListState(this.dataContainer, [this.properties = const []]);

  @override
  List<Object?> get props => [properties];

}

class TodoListInitialState extends TodoListState {
  const TodoListInitialState(super.dataContainer);
}

class TodoListUpdatedState extends TodoListState {
  TodoListUpdatedState(TodoDataContainer dataContainer): super(dataContainer, [DateTime.now()]);
}
