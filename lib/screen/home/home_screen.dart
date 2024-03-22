import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/screen/stats/stats_tab.dart';

import 'package:flutter_todo_app/screen/todo_detail/todo_detail_screen.dart';
import 'package:flutter_todo_app/screen/todo_overview/todo_overview_tab.dart';
import 'package:flutter_todo_app/widget/common_appbar_widget.dart';
import 'package:flutter_todo_app/widget/home_tab_button.dart';

import 'home_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CommonAppBarWidget(
              title: 'Todo list screen',
            ),
            body: IndexedStack(
              index: state.tab.index,
              children: const [TodoOverviewTab(), StatsTab()],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () => Navigator.pushNamed(
                  context, TodoDetailScreen.path,
                  arguments: -1),
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeTabButton(
                    groupValue: state.tab,
                    value: HomeTab.todos,
                    icon: const Icon(Icons.featured_play_list_rounded),
                  ),
                  HomeTabButton(
                    groupValue: state.tab,
                    value: HomeTab.stats,
                    icon: const Icon(Icons.query_stats_rounded),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
