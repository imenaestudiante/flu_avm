import 'package:flutter/material.dart';
import 'package:flu_avm/Config/config.dart';
import 'package:flu_avm/presentation/screens/domus/domus_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: DomusScreen()
          );
  }
}
 