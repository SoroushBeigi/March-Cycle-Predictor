import 'package:flutter/material.dart';
import 'package:march_cycle_predictor/app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> ensureInitializedApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setup();
  //Implement any initialization before running the app.
}

void main() async {
  await ensureInitializedApp();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) => const App(),
    ),
  );
}
