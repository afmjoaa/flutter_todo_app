import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/screen/home/home_cubit/home_cubit.dart';

class HomeTabButton extends StatelessWidget {
  const HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      iconSize: 32,
      color: groupValue != value ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
      icon: icon,
    );
  }
}