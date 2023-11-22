import 'package:flutter/material.dart';
import 'package:march_cycle_predictor/app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) => const App(),
    ),
  );
}
