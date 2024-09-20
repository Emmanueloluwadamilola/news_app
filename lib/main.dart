import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/services/firebase/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(const App());
}
