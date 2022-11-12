import 'package:flutter/material.dart';
import 'package:minhas_vacinas/provider/vacinas_provider.dart';
import 'package:provider/provider.dart';
import 'pages/vacinas.dart';

class MinhasVacinas extends StatelessWidget {
  const MinhasVacinas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacinas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => VacinasProvider())],
        child: const Vacinas(
          id: null,
        ),
      ),
    );
  }
}
