import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/routing/app_router.dart';
import 'package:stories_web_app/core/routing/routes.dart';
import 'package:stories_web_app/core/theming/colors.dart';

class StoriesWebApp extends StatelessWidget {
  const StoriesWebApp({super.key, required this.appRouter});
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
        initialRoute: Routes.getStartedScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
