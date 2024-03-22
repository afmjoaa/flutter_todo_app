import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeState {
  final ThemeData themeData;
  final ThemeType themeType;

  ThemeState(this.themeData, this.themeType);
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(light, ThemeType.light));

  void toggleTheme() {
    emit(state.themeType == ThemeType.light
        ? ThemeState(dark, ThemeType.dark)
        : ThemeState(light, ThemeType.light));
  }

  static ThemeData get light {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade100,
          foregroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 117, 208, 247)),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0B4057),
          foregroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 16, 46, 59),
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
