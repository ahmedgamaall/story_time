import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/features/suggestions/logic/suggestions_cubit.dart';
import 'package:stories_admin_dashboard/features/suggestions/logic/suggestions_states.dart';
import 'package:stories_admin_dashboard/features/suggestions/ui/widgets/suggestion_card.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SuggestionsCubit, SuggestionsStates>(
            buildWhen: (previous, current) => current is LoadingSuggestion || current is SuccessSuggestion || current is FailureSuggestion,
            builder: (context, state) {
              if (state is SuccessSuggestion) {
                if (state.suggestions.isEmpty) {
                  return Center(
                    child: Text(
                      'Their is no Suggestions',
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
                      state.suggestions.length,
                      (index) => SuggestionCard(
                        suggestion: state.suggestions[index],
                      ),
                    ),
                  ),
                );
              } else if (state is FailureSuggestion) {
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
        ],
      ),
    );
  }
}
