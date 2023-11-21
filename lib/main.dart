import 'package:flutter/material.dart';
import 'package:march_cycle_predictor/app.dart';

void main() async{
  await ensureInitializedApp();
  runApp(const MyApp());
}

Future<void> ensureInitializedApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Implement any initialization before running the app.
}



