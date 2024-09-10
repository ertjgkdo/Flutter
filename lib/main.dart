import 'package:flutter/material.dart';
import 'package:newproject/features/mainScreen/presentation/widgets/screens.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Screens(),
    );
  }
}
