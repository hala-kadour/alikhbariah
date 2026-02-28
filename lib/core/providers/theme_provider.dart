import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  static const String key = "theme_mode";
  final SharedPreferencesAsync _async = SharedPreferencesAsync();
  @override
  Future<ThemeMode> build() async {
    return fromString(await _async.getString(key));
  }

  ThemeMode fromString(String? mode) {
    return mode == "light"
        ? ThemeMode.light
        : mode == "dark"
        ? ThemeMode.dark
        : ThemeMode.system;
  }

  String fromTheme(ThemeMode? mode) {
    return mode == ThemeMode.light
        ? "light"
        : mode == ThemeMode.dark
        ? "dark"
        : "system";
  }

  Future<void> changeTheme(ThemeMode theme) async {
    // state = AsyncLoading();
    try {
      await _async.setString(key, fromTheme(theme));
      state = AsyncData(theme);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> toggleTheme() async {
    // state = AsyncLoading();
    try {
      state = AsyncData(
        state.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
      );
      await _async.setString(key, fromTheme(state.value));
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  ThemeMode getMode() {
    return state.value ?? ThemeMode.system;
  }
}

final themeNotifierProvider = AsyncNotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);
