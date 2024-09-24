import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_web_app/core/helpers/spacing.dart';
import 'package:stories_web_app/core/widgets/app_text_form_field.dart';
import 'package:stories_web_app/features/suggestion/logic/suggestion_cubit.dart';

class AddSuggestionForm extends StatelessWidget {
  const AddSuggestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    SuggestionCubit cubit = context.read<SuggestionCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.nameController,
            labelText: 'Your Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your Name';
              }
              return null;
            },
          ),
          verticalSpace(30),
          AppTextFormField(
            controller: cubit.emailController,
            labelText: 'Your Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your Email';
              }
              return null;
            },
          ),
          verticalSpace(30),
          AppTextFormField(
            controller: cubit.titleController,
            labelText: 'Story title',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Story title';
              }
              return null;
            },
          ),
          verticalSpace(30),
          AppTextFormField(
            controller: cubit.contentController,
            labelText: 'Story Content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
