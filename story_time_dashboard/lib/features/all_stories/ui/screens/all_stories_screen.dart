import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_cubit.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_states.dart';
import 'package:stories_admin_dashboard/features/all_stories/ui/widgets/delete_story_bloc_listener.dart';
import 'package:stories_admin_dashboard/features/all_stories/ui/widgets/story_card.dart';

class AllStoriesScreen extends StatelessWidget {
  const AllStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllStoriesCubit cubit = context.read<AllStoriesCubit>();

    return Container(
      padding: EdgeInsets.all(20.h),
      color: ColorsManager.gray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => cubit.getAllStories(),
            child: Icon(
              Icons.replay_outlined,
              color: ColorsManager.darkBlue,
              size: 40.sp,
            ),
          ),
          BlocBuilder<AllStoriesCubit, AllStoriesStates>(
            buildWhen: (previous, current) =>
                current is LoadingAllStories ||
                current is SuccessAllStories ||
                current is FailureAllStories,
            builder: (context, state) {
              if (state is SuccessAllStories) {
                if (state.stories.isEmpty) {
                  return Center(
                    child: Text(
                      'Their is no stories',
                      style: TextStyles.font25DarkBlueBold,
                    ),
                  );
                }
                return Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    children: List.generate(
                      state.stories.length,
                      (index) => StoryCard(
                        story: state.stories[index],
                        // cubit: cubit,
                      ),
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
          const DeleteStoryBlocListener(),
        ],
      ),
    );
  }
}
