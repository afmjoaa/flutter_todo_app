part of 'stats_bloc.dart';

sealed class StatsEvent extends Equatable {
  final List properties;

  const StatsEvent([this.properties = const []]);

  @override
  List<Object> get props => [properties];
}

final class StatsSubscriptionRequested extends StatsEvent {
  final List<TodoModel> todos;

  StatsSubscriptionRequested(this.todos): super([todos]);
}
