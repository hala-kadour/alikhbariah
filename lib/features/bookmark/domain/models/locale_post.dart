import 'package:objectbox/objectbox.dart';

@Entity()
class LocalCollection {
  @Id()
  int id = 0; // معرف تلقائي

  @Unique()
  late String name; // اسم المجموعة (مثل: المفضلة)

  // علاقة One-to-Many: المجموعة تحتوي على عدة بوستات
  final posts = ToMany<LocalPost>();

  LocalCollection({this.id = 0, required this.name});
}

@Entity()
class LocalPost {
  @Id()
  int id = 0;

  @Unique()
  late String remoteId; // الـ ID القادم من Supabase لضمان عدم التكرار
  late String title;
  late String summary;
  late String content;
  String? imageUrl;
  String? localImagePath; // المسار الذي سنحفظ فيه الصورة للـ Offline

  @Property(type: PropertyType.date)
  DateTime? savedAt; // تاريخ الحفظ

  // 💡 هذا هو الجزء الناقص الذي يسبب الخطأ في الصورة:
  @Backlink('posts') // يجب أن يطابق اسم الحقل في LocalCollection
  final collections = ToMany<LocalCollection>();

  LocalPost({
    this.id = 0,
    required this.remoteId,
    required this.title,
    required this.summary,
    required this.content,
    this.imageUrl,
    this.localImagePath,
    this.savedAt,
  });
}
