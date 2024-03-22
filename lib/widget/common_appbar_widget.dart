import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/theme/theme_cubit.dart';

class CommonAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            tooltip: 'Toggle Theme',
            onPressed: () {
              themeCubit.toggleTheme();
            },
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30),
                  right: Radius.circular(30),
                ),
              ),
            ),
            icon: Icon(themeCubit.state.themeType == ThemeType.light
                ? Icons.dark_mode
                : Icons.light_mode),
          ),
        ),
      ],
      title: Text(
        title,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}
