import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';

import 'config/router/app_router.dart';
import 'config/theme/theme_data/theme_data_dark.dart';
import 'config/theme/theme_data/theme_data_light.dart';
import 'core/providers/theme_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // await Localization.loadArabicFromJson();

  // await AppEnv.init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Supabase.initialize(url: AppEnv.baseUrl, anonKey: AppEnv.annonKey);

  // final dbService = await ObjectBoxService.init();
  // await NotificationService().initialize();
  runApp(ProviderScope(child: I18n(autoSaveLocale: true, child: MainApp())));
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
      locale: I18n.locale,
      // Routing Thing //
      routerConfig: router,
      builder: (context, child) => child!,
    );
  }
}
