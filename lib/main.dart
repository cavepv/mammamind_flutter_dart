import 'package:flutter/material.dart';

import 'landing_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MammaMindApp());
}

class MammaMindApp extends StatelessWidget {
  const MammaMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MammaMind (Flutter/Dart demo)',
      debugShowCheckedModeBanner: false,
      theme: buildMammaMindTheme(),
      home: const LandingScreen(),
    );
  }
}
