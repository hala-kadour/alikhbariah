import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ImageDownloader {
  static Future<String?> downloadAndSaveImage(
    String imageUrl,
    String postId,
  ) async {
    if (imageUrl.isEmpty) return null;

    try {
      // 1. الحصول على مسار مجلد المستندات في التطبيق
      final directory = await getApplicationDocumentsDirectory();

      // 2. إنشاء مجلد فرعي للصور ليكون الشغل مرتباً
      final imagesDir = Directory(p.join(directory.path, 'saved_news_images'));
      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      // 3. استخراج الامتداد (.jpg أو .png)
      final extension = p.extension(imageUrl).split('?').first;
      if (extension.isEmpty) return null;

      // 4. تحديد المسار النهائي للملف باستخدام معرف البوست
      final fileName = "post_$postId$extension";
      final savedPath = p.join(imagesDir.path, fileName);

      // 5. تحميل الصورة فعلياً
      await Dio().download(imageUrl, savedPath);

      // نرجع المسار المحلي لنخزنه في ObjectBox
      return savedPath;
    } catch (e) {
      log("Error downloading image: $e");
      return null;
    }
  }

  // تابع لحذف الصورة عند إلغاء الحفظ (لتوفير المساحة)
  static Future<void> deleteImage(String? path) async {
    if (path == null || path.isEmpty) return;
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      log("Error deleting local image: $e");
    }
  }
}
