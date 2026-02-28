import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  StorageService._();

  static final _storage = Supabase.instance.client.storage;
  static const String _bucket = 'news-media';

  static Future<String> uploadImageBytes({
    required Uint8List bytes,
    required String folder, // posts | categories
    required String fileName,
  }) async {
    final path = '$folder/$fileName';

    await _storage
        .from(_bucket)
        .uploadBinary(
          path,
          bytes,
          fileOptions: const FileOptions(upsert: true),
        );

    final publicUrl = _storage.from(_bucket).getPublicUrl(path);
    return publicUrl;
  }

  static Future<void> deleteImageByUrl(String imageUrl) async {
    final path = _extractPathFromUrl(imageUrl);
    if (path == null) return;

    await _storage.from(_bucket).remove([path]);
  }

  static String? _extractPathFromUrl(String url) {
    final marker = '/$_bucket/';
    final index = url.indexOf(marker);
    if (index == -1) return null;
    return url.substring(index + marker.length);
  }
}
