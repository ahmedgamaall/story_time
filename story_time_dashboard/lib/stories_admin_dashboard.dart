import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/routing/app_router.dart';
import 'package:stories_admin_dashboard/core/routing/routes.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';

class StoriesAdminDashboard extends StatelessWidget {
  const StoriesAdminDashboard({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Tajawal',
          primaryColor: ColorsManager.darkBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
