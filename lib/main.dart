import 'package:filmex/core/utils/App_String.dart';
import 'package:filmex/filmex/domain/entities/filmex.dart';
import 'package:filmex/filmex/presentation/screens/filmex_screen.dart';
import 'package:filmex/filmex/presentation/screens/show_all_filmex.dart';
import 'package:flutter/material.dart';

import 'core/services/services_locator.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const FilmexScreen(),
    );
  }
}

