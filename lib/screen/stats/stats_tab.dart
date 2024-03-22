import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/cubit/todo_list_cubit.dart';

import 'bloc/stats_bloc.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({super.key});

  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> {
  late final StatsBloc statsBloc;

  @override
  void initState() {
    super.initState();
    statsBloc = StatsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        statsBloc.add(StatsSubscriptionRequested(state.todos));
        return BlocProvider(
          create: (context) => statsBloc,
          child: const StatsView(),
        );
      },
    );
  }
}

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<StatsBloc>().state;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.check_rounded),
            title: Text("Completed Todos"),
            trailing: Text(
              '${state.completedTodos}',
              style: textTheme.headlineSmall,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.radio_button_unchecked_rounded),
            title: Text("Active Todos"),
            trailing: Text(
              '${state.activeTodos}',
              style: textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
