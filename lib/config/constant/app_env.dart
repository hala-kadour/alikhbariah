import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  static String get baseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get annonKey => dotenv.env['SUPABASE_ANNON_KEY'] ?? '';
}
