import 'package:alikhbariah/config/constant/app_env.dart';
import 'package:alikhbariah/core/services/object_box_service.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/add_post_to_collection_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/delete_collection_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/get_all_collections_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/get_collection_posts_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/get_post_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/is_post_saved_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/remove_post_from_collection_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/save_collection_use_case.dart';
import 'package:alikhbariah/features/explore/data/datasource/explore_supabase_data_source.dart';
import 'package:alikhbariah/features/explore/data/repository/explore_repository_impl.dart';
import 'package:alikhbariah/features/explore/domain/repository/explore_repository.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_active_categories_use_case.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_category_posts_use_case.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_searched_posts_use_case.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_tag_posts_use_case.dart';
import 'package:alikhbariah/features/home/data/datasource/home_supabase_data_source.dart';
import 'package:alikhbariah/features/home/domain/usecases/get_breaking_posts_use_case.dart';
import 'package:alikhbariah/features/home/domain/usecases/get_featured_posts_use_case.dart';
import 'package:alikhbariah/features/home/domain/usecases/get_post_tags_use_case.dart';
import 'package:alikhbariah/features/home/domain/usecases/get_related_posts_use_case.dart';
import 'package:alikhbariah/features/notifications/data/datasource/notification_supabase_data_source.dart';
import 'package:alikhbariah/features/notifications/data/repository/notification_repository_impl.dart';
import 'package:alikhbariah/features/notifications/domain/repository/notification_repository.dart';
import 'package:alikhbariah/features/notifications/domain/usecases/get_notification_use_case.dart';
import 'package:alikhbariah/firebase_options.dart';
import 'package:alikhbariah/translation/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/bookmark/data/datasource/bookmark_locale_data_source.dart';
import 'features/bookmark/data/repository/bookmark_repository_impl.dart';
import 'features/bookmark/domain/repository/bookmark_repository.dart';
import 'features/home/data/repository/home_repository_impl.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/domain/usecases/get_latest_posts_use_case.dart';
import 'features/notifications/application/notification_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1. الإعدادات والبيئة (App Services)
  await AppEnv.init();
  await Localization.loadArabicFromJson();

  // 2. الخدمات الخارجية (External SDKs)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(url: AppEnv.baseUrl, anonKey: AppEnv.annonKey);
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // 3. الخدمات المحلية (Local Services)
  // ObjectBox
  final dbService = await ObjectBoxService.init();
  sl.registerSingleton<ObjectBoxService>(dbService);

  // Notifications
  final notificationService = NotificationService();
  await notificationService.initialize();
  sl.registerSingleton<NotificationService>(notificationService);

  // 4. Features
  _initHomeFeature();
  _initExploreFeature();
  _initBookmarkFeature();
  _initNotificationFeature();
}

void _initHomeFeature() {
  // 1. Data Source
  sl.registerLazySingleton<HomeSupabaseDataSource>(
    () => HomeSupabaseDataSourceImpl(sl()),
  );

  // 2. Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  // 3. Use Cases
  sl.registerLazySingleton(() => GetBreakingPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetFeaturedPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetLatestPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetPostTagsUseCase(sl()));
  sl.registerLazySingleton(() => GetRelatedPostsUseCase(sl()));
}

void _initExploreFeature() {
  // 1. Data Source
  sl.registerLazySingleton<ExploreSupabaseDataSource>(
    () => ExploreSupabaseDataSourceImpl(sl()),
  );

  // 2. Repository
  sl.registerLazySingleton<ExploreRepository>(
    () => ExploreRepositoryImpl(sl()),
  );

  // 3. Use Cases
  sl.registerLazySingleton(() => GetActiveCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoryPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetTagPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetPostTagsUseCase(sl()));
  sl.registerLazySingleton(() => GetSearchedPostsUseCase(sl()));
}

void _initBookmarkFeature() {
  // 1. Data Source
  sl.registerLazySingleton<BookmarkLocaleDataSource>(
    () => BookmarkLocaleDataSourceImpl(sl()),
  );

  // 2. Repository
  sl.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(sl()),
  );

  // 3. Use Cases
  sl.registerLazySingleton(() => AddPostToCollectionUseCase(sl()));
  sl.registerLazySingleton(() => DeleteCollectionUseCase(sl()));
  sl.registerLazySingleton(() => GetAllCollectionsUseCase(sl()));
  sl.registerLazySingleton(() => GetCollectionPostsUseCase(sl()));
  sl.registerLazySingleton(() => GetPostUseCase(sl()));
  sl.registerLazySingleton(() => IsPostSavedUseCase(sl()));
  sl.registerLazySingleton(() => RemovePostFromCollectionUseCase(sl()));
  sl.registerLazySingleton(() => SaveCollectionUseCase(sl()));
}

void _initNotificationFeature() {
  // 1. Data Source
  sl.registerLazySingleton<NotificationSupabaseDataSource>(
    () => NotificationSupabaseDataSourceImpl(sl()),
  );

  // 2. Repository
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl()),
  );

  // 3. Use Cases
  sl.registerLazySingleton(() => GetNotificationUseCase(sl()));
}
