import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  const SupabaseService._();
  static final _client = Supabase.instance.client;
  static SupabaseClient get client => _client;
}
