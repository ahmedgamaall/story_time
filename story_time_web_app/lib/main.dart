import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/di/dependency_injection.dart';
import 'package:stories_web_app/core/helpers/custom_observer.dart';
import 'package:stories_web_app/core/routing/app_router.dart';
import 'package:stories_web_app/stories_web_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDi();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  await ScreenUtil.ensureScreenSize();
  runApp(
    StoriesWebApp(
      appRouter: AppRouter(),
    ),
  );
}
