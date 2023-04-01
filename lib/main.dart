import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const GenericApp());
}

class GenericApp extends StatelessWidget {
  const GenericApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
