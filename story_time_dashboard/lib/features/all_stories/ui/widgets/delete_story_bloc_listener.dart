import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/core/helpers/extensions.dart';
import 'package:stories_admin_dashboard/core/widgets/error_dialog.dart';
import 'package:stories_admin_dashboard/core/widgets/loading_dialog.dart';
import 'package:stories_admin_dashboard/core/widgets/success_dialog.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_cubit.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_states.dart';

class DeleteStoryBlocListener extends StatelessWidget {
  const DeleteStoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    final AllStoriesCubit cubit = context.read<AllStoriesCubit>();

    return BlocListener<AllStoriesCubit, AllStoriesStates>(
      listenWhen: (previous, current) =>
          current is LoadingDeleteStory ||
          current is FailureDeleteStory ||
          current is SuccessDeleteStory,
      listener: (context, state) {
        if (state is SuccessDeleteStory) {
          context.pop();
          successDialog(
            context: context,
            content: 'The story deleted Successfully',
          );
          cubit.getAllStories();
        } else if (state is FailureDeleteStory) {
          context.pop();
          return errorDialog(
            context: context,
            content: state.error,
          );
        } else {
          return loadingDialog(context: context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
