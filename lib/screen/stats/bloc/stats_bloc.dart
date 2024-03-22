import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo_app/model/todo_model.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc() : super(const StatsState()) {
    on<StatsSubscriptionRequested>(_onSubscriptionRequested);
  }

  Future<void> _onSubscriptionRequested(
    StatsSubscriptionRequested event,
    Emitter<StatsState> emit,
  ) async {
    emit(state.copyWith(status: StatsStatus.loading));

    int completedTodos = 0;
    int activeTodos = 0;
    event.todos.forEach((element) {
      element.isDone ? completedTodos++: activeTodos++;
    });

    emit(state.copyWith(
      status: StatsStatus.success,
      completedTodos: completedTodos,
      activeTodos: activeTodos,
    ));
  }
}
