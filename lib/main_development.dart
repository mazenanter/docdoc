import 'package:docdoc/app_doc.dart';
import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/helpers/extenstions.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkIfLoggedIn();
  // to fix text hidden bug in flutter screen util in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(AppDoc(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedIn() async {
  String? token = await SharedPrefHelper.getSecuredData(SharedPrefKeys.TOKEN);
  if (!token.isNullOrEmpty) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
