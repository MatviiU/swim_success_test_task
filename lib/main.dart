import 'package:flutter/material.dart';
import 'package:swim_success/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Swim Success', theme: AppTheme.dark);
  }
}
