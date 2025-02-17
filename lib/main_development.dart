import 'package:docdoc/app_doc.dart';
import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  // to fix text hidden bug in flutter screen util in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(AppDoc(
    appRouter: AppRouter(),
  ));
}
