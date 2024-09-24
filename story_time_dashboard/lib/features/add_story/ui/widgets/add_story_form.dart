import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/widgets/app_text_form_field.dart';
import 'package:stories_admin_dashboard/features/add_story/logic/add_story_cubit.dart';
import 'package:stories_admin_dashboard/features/add_story/ui/widgets/upload_image.dart';

class AddStoryForm extends StatelessWidget {
  const AddStoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    AddStroyCubit cubit = context.read<AddStroyCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: cubit.titleController,
                      labelText: 'Story title',
                      mainColor: ColorsManager.darkBlue,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Story title';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),
                    AppTextFormField(
                      controller: cubit.moralController,
                      labelText: 'Story moral',
                      mainColor: ColorsManager.darkBlue,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Story moral';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),
                    AppTextFormField(
                      controller: cubit.sectionController,
                      labelText: 'Story section',
                      mainColor: ColorsManager.darkBlue,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Story section';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: UploadImage(
                  imagePath: (Uint8List file) {
                    cubit.cover = file;
                  },
                ),
              ),
            ],
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: cubit.contentController,
            labelText: 'Story content',
            keyboardType: TextInputType.name,
            mainColor: ColorsManager.darkBlue,
            maxLines: 10,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Story content';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
