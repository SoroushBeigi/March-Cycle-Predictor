import 'package:flutter/material.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/bloc/period_bloc.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/period_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home:  BlocProvider(
        create: (context) => PeriodBloc(),
        child: const PeriodScreen(),
      ),
    );
  }
}
