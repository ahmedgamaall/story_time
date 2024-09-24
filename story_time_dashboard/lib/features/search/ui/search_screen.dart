import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/core/widgets/app_text_form_field.dart';
import 'package:stories_admin_dashboard/features/search/logic/search_cubit.dart';
import 'package:stories_admin_dashboard/features/search/logic/search_states.dart';
import 'package:stories_admin_dashboard/features/search/ui/widgets/story_card_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = context.read<SearchCubit>();
    return Container(
      color: ColorsManager.gray,
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.titleController,
            labelText: 'Story title',
            mainColor: ColorsManager.darkBlue,
            keyboardType: TextInputType.name,
            suffixIcon: IconButton(
              onPressed: () {
                cubit.search();
              },
              icon: Icon(
                Icons.search,
                size: 30.sp,
              ),
            ),
          ),
          verticalSpace(20),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchStates>(
              buildWhen: (previous, current) => current is LoadingSearch || current is SuccessSearch || current is FailureSearch,
              builder: (context, state) {
                if (state is SuccessSearch) {
                  if (state.stories.isEmpty) {
                    return Center(
                      child: Text(
                        'Their is no stories',
                        style: TextStyles.font25DarkBlueBold,
                      ),
                    );
                  }
                  return GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    children: List.generate(
                      state.stories.length,
                      (index) => StoryCardSearch(
                        story: state.stories[index],
                      ),
                    ),
                  );
                } else if (state is FailureSearch) {
                  return Center(
                    child: Text(
                      state.error,
                      style: TextStyles.font25DarkBlueBold,
                    ),
                  );
                } else if (state is LoadingSearch) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.darkBlue,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
