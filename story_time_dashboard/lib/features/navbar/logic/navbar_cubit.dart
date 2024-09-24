import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/core/di/dependency_injection.dart';
import 'package:stories_admin_dashboard/features/add_story/logic/add_story_cubit.dart';
import 'package:stories_admin_dashboard/features/add_story/ui/add_story_screen.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_cubit.dart';
import 'package:stories_admin_dashboard/features/all_stories/ui/screens/all_stories_screen.dart';
import 'package:stories_admin_dashboard/features/navbar/data/models/tab_model.dart';
import 'package:stories_admin_dashboard/features/navbar/logic/navbar_states.dart';
import 'package:stories_admin_dashboard/features/search/logic/search_cubit.dart';
import 'package:stories_admin_dashboard/features/search/ui/search_screen.dart';
import 'package:stories_admin_dashboard/features/suggestions/logic/suggestions_cubit.dart';
import 'package:stories_admin_dashboard/features/suggestions/ui/screens/suggestions_screen.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInitialState());

  int currentIndex = 0;

  List<TabModel> tabs = [
    TabModel(
      icon: Icons.apps,
      title: 'All Stories',
      screen: BlocProvider(
        create: (context) => getIt<AllStoriesCubit>()..getAllStories(),
        child: const AllStoriesScreen(),
      ),
    ),
    TabModel(
      icon: Icons.add,
      title: 'Add Story',
      screen: BlocProvider(
        create: (context) => getIt<AddStroyCubit>(),
        child: const AddStoryScreen(),
      ),
    ),
    TabModel(
      icon: Icons.search,
      title: 'Search',
      screen: BlocProvider(
        create: (context) => getIt<SearchCubit>(),
        child: const SearchScreen(),
      ),
    ),
    TabModel(
      icon: Icons.description,
      title: 'Suggestions',
      screen: BlocProvider(
        create: (context) => getIt<SuggestionsCubit>()..getSuggestions(),
        child: const SuggestionsScreen(),
      ),
    ),
  ];

  void changeIndexInsideNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
