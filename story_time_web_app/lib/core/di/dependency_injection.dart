import 'package:get_it/get_it.dart';
import 'package:stories_web_app/core/networking/firebase.dart';
import 'package:stories_web_app/features/all_stories/data/repo/all_stories_repo.dart';
import 'package:stories_web_app/features/all_stories/logic/all_stories_cubit.dart';
import 'package:stories_web_app/features/search/data/repo/search_repo.dart';
import 'package:stories_web_app/features/search/logic/search_cubit.dart';
import 'package:stories_web_app/features/suggestion/data/repo/suggestion_repo.dart';
import 'package:stories_web_app/features/suggestion/logic/suggestion_cubit.dart';

final getIt = GetIt.instance;

/// Dependency Injection
void setupDi() {
  getIt.registerLazySingleton<FirebaseNetwork>(() => FirebaseNetwork());

  // all stories
  getIt.registerLazySingleton<AllStoriesRepo>(() => AllStoriesRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<AllStoriesCubit>(() => AllStoriesCubit(getIt<AllStoriesRepo>()));

  // search
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));

  // suggestion
  getIt.registerLazySingleton<SuggestionRepo>(() => SuggestionRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<SuggestionCubit>(() => SuggestionCubit(getIt<SuggestionRepo>()));
}
