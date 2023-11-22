import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme.dart';
import 'features/feature_period/presentation/bloc/period_bloc.dart';
import 'features/feature_period/presentation/period_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: BlocProvider(
        create: (context) => PeriodBloc(),
        child: const PeriodScreen(),
      ),
    );
  }
}
