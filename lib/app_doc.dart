import 'package:docdoc/core/routing/app_router.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDoc extends StatelessWidget {
  const AppDoc({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'docdoc',
          theme: ThemeData(
            primaryColor: ColorsManager.primaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute),
    );
  }
}
