import 'package:flutter/material.dart';
import 'package:minhas_vacinas/models/vacin.dart';
import 'package:minhas_vacinas/pages/vacinas_details.dart';
import 'package:minhas_vacinas/repositories/vacinas_reposit.dart';
import 'package:minhas_vacinas/widges/vacina_image_card.dart';
import 'package:minhas_vacinas/widges/vacinas_grid_view.dart';

import '../models/vacin.dart';
import '../repositories/vacinas_reposit.dart';

class Vacinas extends StatefulWidget {
  const Vacinas({Key? key}) : super(key: key);

  @override
  State<Vacinas> createState() => _VacinasState();
}

class _VacinasState extends State<Vacinas> {
  late final List<Vacin> vacinaList;

  @override
  void initState() {
    super.initState();
    vacinaList = VacinasReposit().vacina;
  }

  openDetails(Vacin vacin) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => VacinaDetailsPage(vacin: vacin)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Minhas Vacinas'),
        ),
        body: VacinasGridView(
          vacin: List.from(
            vacinaList.map(
              (Vacin vacin) => VacinaImageCard(
                image: vacin.image,
                onTap: () => openDetails(vacin),
                vacin: (vacin),
              ),
            ),
          ),
        ));
  }
}
