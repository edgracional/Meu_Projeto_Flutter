import 'package:flutter/material.dart';
import 'package:minhas_vacinas/pages/vacinas.dart';

class MinhasVacinas extends StatelessWidget {
  const MinhasVacinas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacinas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Vacinas(
        id: null,
      ),
    );
  }
}
