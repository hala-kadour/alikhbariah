import 'package:objectbox/objectbox.dart';

@Entity()
class LocalCollection {
  @Id()
  int id = 0;
  @Unique()
  late String name;

  final posts = ToMany<LocalPost>();

  LocalCollection({this.id = 0, required this.name});
}

@Entity()
class LocalPost {
  @Id()
  int id = 0;

  @Unique()
  late String remoteId;
  late String title;
  late String summary;
  late String content;
  String? imageUrl;
  String? localImagePath;

  @Property(type: PropertyType.date)
  DateTime? savedAt;
  @Backlink('posts')
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
