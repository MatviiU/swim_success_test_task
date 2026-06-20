import 'package:flutter/material.dart';
import 'package:swim_success/core/constants/app_constants.dart';
import 'package:swim_success/core/di/injector.dart';
import 'package:swim_success/core/router/app_router.dart';
import 'package:swim_success/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStringsConstants.appName,
      theme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}
