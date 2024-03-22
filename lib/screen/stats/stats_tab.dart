import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();

    //   BlocProvider(
    //   create: (context) => StatsBloc(
    //     todosRepository: context.read<TodosRepository>(),
    //   )..add(const StatsSubscriptionRequested()),
    //   child: const StatsView(),
    // );
  }
}

// class StatsView extends StatelessWidget {
//   const StatsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     final state = context.watch<StatsBloc>().state;
//     final textTheme = Theme.of(context).textTheme;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(l10n.statsAppBarTitle),
//       ),
//       body: Column(
//         children: [
//           ListTile(
//             leading: const Icon(Icons.check_rounded),
//             title: Text(l10n.statsCompletedTodoCountLabel),
//             trailing: Text(
//               '${state.completedTodos}',
//               style: textTheme.headlineSmall,
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.radio_button_unchecked_rounded),
//             title: Text(l10n.statsActiveTodoCountLabel),
//             trailing: Text(
//               '${state.activeTodos}',
//               style: textTheme.headlineSmall,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
