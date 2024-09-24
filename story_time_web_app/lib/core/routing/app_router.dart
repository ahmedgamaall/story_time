import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_web_app/core/di/dependency_injection.dart';
import 'package:stories_web_app/core/routing/routes.dart';
import 'package:stories_web_app/features/all_stories/data/models/story_response_body.dart';
import 'package:stories_web_app/features/all_stories/logic/all_stories_cubit.dart';
import 'package:stories_web_app/features/all_stories/ui/screens/all_stories_screen.dart';
import 'package:stories_web_app/features/all_stories/ui/screens/story_screen.dart';
import 'package:stories_web_app/features/get_started/ui/screens/get_started_screen.dart';
import 'package:stories_web_app/features/search/logic/search_cubit.dart';
import 'package:stories_web_app/features/search/ui/search_screen.dart';
import 'package:stories_web_app/features/suggestion/logic/suggestion_cubit.dart';
import 'package:stories_web_app/features/suggestion/ui/screens/suggestion_screen.dart';

/// Manage Routes
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.getStartedScreen:
        return MaterialPageRoute(
          builder: (context) => const GetStartedScreen(),
        );

      case Routes.allStoriesScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AllStoriesCubit>()..getAllStories(),
            child: const AllStoriesScreen(),
          ),
        );

      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: const SearchScreen(),
          ),
        );

      case Routes.storyScreen:
        StoryResponseBody story = settings.arguments as StoryResponseBody;

        return MaterialPageRoute(
          builder: (context) => StoryScreen(story: story),
        );

      case Routes.suggestionScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SuggestionCubit>(),
            child: const SuggestionScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
