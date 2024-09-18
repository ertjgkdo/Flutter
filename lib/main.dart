import 'dart:ui';

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
      scrollBehavior: MyScroll(),
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Screens(),
    );
  }
}

class MyScroll extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
