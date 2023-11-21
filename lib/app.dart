import 'package:flutter/material.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/period_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const PeriodScreen(),
    );
  }
}