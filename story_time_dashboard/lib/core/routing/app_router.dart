import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/core/di/dependency_injection.dart';
import 'package:stories_admin_dashboard/core/routing/routes.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';
import 'package:stories_admin_dashboard/features/all_stories/ui/screens/story_screen.dart';
import 'package:stories_admin_dashboard/features/edit_story/logic/edit_story_cubit.dart';
import 'package:stories_admin_dashboard/features/edit_story/ui/edit_story_screen.dart';
import 'package:stories_admin_dashboard/features/login/logic/login_cubit.dart';
import 'package:stories_admin_dashboard/features/login/ui/screens/login_screen.dart';
import 'package:stories_admin_dashboard/features/navbar/logic/navbar_cubit.dart';
import 'package:stories_admin_dashboard/features/navbar/ui/screens/nav_bar_screen.dart';
import 'package:stories_admin_dashboard/features/suggestions/data/models/suggestion_response.dart';
import 'package:stories_admin_dashboard/features/suggestions/ui/screens/suggestion_screen.dart';

/// Manage Routes
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.navbarScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<NavBarCubit>(),
            child: const NavBarScreen(),
          ),
        );

      case Routes.storyScreen:
        StoryResponseBody story = settings.arguments as StoryResponseBody;

        return MaterialPageRoute(
          builder: (context) => StoryScreen(story: story),
        );

      case Routes.editStoryScreen:
        StoryResponseBody story = settings.arguments as StoryResponseBody;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<EditStroyCubit>()..setValues(story),
            child: const EditStoryScreen(),
          ),
        );

      case Routes.suggestionScreen:
        SuggestionResponse suggestion = settings.arguments as SuggestionResponse;

        return MaterialPageRoute(
          builder: (context) => SuggestionScreen(suggestion: suggestion),
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
