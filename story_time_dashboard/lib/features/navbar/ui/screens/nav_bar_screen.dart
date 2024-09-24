import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/features/navbar/logic/navbar_cubit.dart';
import 'package:stories_admin_dashboard/features/navbar/logic/navbar_states.dart';
import 'package:stories_admin_dashboard/features/navbar/ui/widgets/custom_tile.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarStates>(
      builder: (context, state) {
        NavBarCubit cubit = context.read<NavBarCubit>();
        return Scaffold(
          backgroundColor: ColorsManager.gray,
          body: SafeArea(
            child: Row(
              children: [
                Container(
                  width: 300.w,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  color: ColorsManager.darkBlue,
                  child: Column(
                    children: List.generate(
                      cubit.tabs.length,
                      (index) => CustomTab(
                        selected: cubit.currentIndex == index,
                        icon: cubit.tabs[index].icon,
                        title: cubit.tabs[index].title,
                        onTap: () {
                          cubit.changeIndexInsideNavBar(index);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: cubit.tabs[cubit.currentIndex].screen,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
