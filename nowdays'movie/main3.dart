import 'package:flutter/material.dart';
import 'package:woo_f/screens/home_screen3.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen3(),
    );
  }
}
