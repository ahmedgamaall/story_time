import 'package:get_it/get_it.dart';
import 'package:stories_admin_dashboard/core/networking/firebase.dart';
import 'package:stories_admin_dashboard/features/add_story/data/repo/add_story_repo.dart';
import 'package:stories_admin_dashboard/features/add_story/logic/add_story_cubit.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/repo/all_stories_repo.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_cubit.dart';
import 'package:stories_admin_dashboard/features/edit_story/data/repo/edit_story_repo.dart';
import 'package:stories_admin_dashboard/features/edit_story/logic/edit_story_cubit.dart';
import 'package:stories_admin_dashboard/features/login/data/repo/login_repo.dart';
import 'package:stories_admin_dashboard/features/login/logic/login_cubit.dart';
import 'package:stories_admin_dashboard/features/navbar/logic/navbar_cubit.dart';
import 'package:stories_admin_dashboard/features/search/data/repo/search_repo.dart';
import 'package:stories_admin_dashboard/features/search/logic/search_cubit.dart';
import 'package:stories_admin_dashboard/features/suggestions/data/repo/suggestions_repo.dart';
import 'package:stories_admin_dashboard/features/suggestions/logic/suggestions_cubit.dart';

final getIt = GetIt.instance;

/// Dependency Injection
void setupDi() {
  getIt.registerLazySingleton<FirebaseNetwork>(() => FirebaseNetwork());

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // navbar
  getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());

  // add story
  getIt.registerLazySingleton<AddStroyRepo>(() => AddStroyRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<AddStroyCubit>(() => AddStroyCubit(getIt<AddStroyRepo>()));

  // all stories
  getIt.registerLazySingleton<AllStoriesRepo>(() => AllStoriesRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<AllStoriesCubit>(() => AllStoriesCubit(getIt<AllStoriesRepo>()));

  // edit Story
  getIt.registerLazySingleton<EditStroyRepo>(() => EditStroyRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<EditStroyCubit>(() => EditStroyCubit(getIt<EditStroyRepo>()));

  // search
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));

  // suggestions
  getIt.registerLazySingleton<SuggestionsRepo>(() => SuggestionsRepo(getIt<FirebaseNetwork>()));
  getIt.registerFactory<SuggestionsCubit>(() => SuggestionsCubit(getIt<SuggestionsRepo>()));
}
