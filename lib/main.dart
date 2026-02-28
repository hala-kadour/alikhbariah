import 'package:alikhbariah/features/notifications/application/notification_service.dart';
import 'package:alikhbariah/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/constant/app_env.dart';
import 'config/router/app_router.dart';
import 'config/theme/theme_data/theme_data_dark.dart';
import 'config/theme/theme_data/theme_data_light.dart';
import 'core/providers/theme_provider.dart';
import 'core/services/object_box_service.dart';
import 'features/bookmark/presentation/providers/bookmark_provider.dart';
import 'translation/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Localization.loadArabicFromJson();

  await AppEnv.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(url: AppEnv.baseUrl, anonKey: AppEnv.annonKey);

  final dbService = await ObjectBoxService.init();
  if (!kIsWeb) {
    await NotificationService().initialize();
  }
  runApp(
    ProviderScope(
      overrides: [objectBoxProvider.overrideWithValue(dbService)],
      child: I18n(autoSaveLocale: true, child: MainApp()),
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
