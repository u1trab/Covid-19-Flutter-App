import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'globals.dart' as globals;

void main() {
  runApp(MaterialApp(
    title: 'Covid-19 App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'QuickSand',
      appBarTheme: const AppBarTheme(
        color: globals.primaryColor,
      ),
    ),
    initialRoute: '/splashscreen',
    routes: {
      '/': (context) => CovidApp(), //οριζουμε τα μονοπατια NamedRoutes
      '/splashscreen': (context) => SplashScreen(),
    },
  ));
}

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('');
  }
}
