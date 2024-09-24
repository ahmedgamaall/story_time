import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/helpers/extensions.dart';
import 'package:stories_web_app/core/helpers/spacing.dart';
import 'package:stories_web_app/core/routing/routes.dart';
import 'package:stories_web_app/core/theming/colors.dart';
import 'package:stories_web_app/core/theming/styles.dart';
import 'package:stories_web_app/features/all_stories/logic/all_stories_cubit.dart';
import 'package:stories_web_app/features/all_stories/logic/all_stories_states.dart';
import 'package:stories_web_app/features/all_stories/ui/widgets/story_card.dart';

class AllStoriesScreen extends StatelessWidget {
  const AllStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.gray,
      appBar: AppBar(
        backgroundColor: ColorsManager.darkBlue,
        leading: Image.asset(
          'assets/images/logo.png',
          height: 80.h,
          width: 80.w,
        ),
        title: Text(
          'All Stories',
          style: TextStyles.font30WhiteBold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.searchScreen);
            },
            child: Text(
              'Search',
              style: TextStyles.font25WhiteRegular,
            ),
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.suggestionScreen);
            },
            child: Text(
              'Add Suggestion',
              style: TextStyles.font25WhiteRegular,
            ),
          ),
          horizontalSpace(30),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: BlocBuilder<AllStoriesCubit, AllStoriesStates>(
          buildWhen: (previous, current) =>
              current is LoadingAllStories ||
              current is SuccessAllStories ||
              current is FailureAllStories,
          builder: (context, state) {
            if (state is SuccessAllStories) {
              if (state.stories.isEmpty) {
                return Center(
                  child: Text(
                    'Thier is no stories',
                    style: TextStyles.font25DarkBlueBold,
                  ),
                );
              }
              return GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                children: List.generate(
                  state.stories.length,
                  (index) => StoryCard(
                    story: state.stories[index],
                  ),
                ),
              );
            } else if (state is FailureAllStories) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyles.font25DarkBlueBold,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.darkBlue,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
