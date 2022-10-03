import 'package:flutter/material.dart';
import 'pages/vacinas.dart';

class MinhasVacinas extends StatelessWidget {
  const MinhasVacinas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacinas',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Vacinas(),
    );
  }
}
