import 'package:flutter/material.dart';
import 'package:news_app/core/app.dart';
import 'package:news_app/core/di/core_module_container.dart';

void main() {
  configureDependencies();
  runApp(const App());
}

