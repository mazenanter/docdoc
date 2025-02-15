import 'package:docdoc/app_doc.dart';
import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(AppDoc(
    appRouter: AppRouter(),
  ));
}
