import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/router/app_router.dart';
import 'config/theme/theme_data/theme_data_dark.dart';
import 'config/theme/theme_data/theme_data_light.dart';
import 'core/providers/theme_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('ar'),
        saveLocale: true,
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: "Alikhbariah",
      debugShowCheckedModeBanner: false,
      // Theming Thing //
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      // themeMode: ThemeMode.light,
      themeMode: themeMode.when(
        data: (mode) => mode,
        error: (error, stackTrace) => ThemeMode.system,
        loading: () => ThemeMode.system,
      ),
      // Localization Thing //
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      // Routing Thing //
      routerConfig: router,
      builder: (context, child) => child!,
    );
  }
}
