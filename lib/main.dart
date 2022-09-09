import 'package:flutter/material.dart';

import 'core/services_locator/services_locator.dart';
import 'core/utils/app_strings.dart';
import 'movies/presentation/pages/movies_screen.dart';

void main() {
  //============================================================================
  ServicesLocator().init();
  //============================================================================

  runApp(const MyApp());
  //============================================================================
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      debugShowCheckedModeBanner: false,
      home: const MoviesScreen(),
    );
  }
}
