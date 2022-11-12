import 'package:flutter/cupertino.dart';
import 'package:minhas_vacinas/models/teste.dart';

class Doses_Repository extends ChangeNotifier {
  static List<Doses> tabela = [
    Doses(
      id: '1',
      icone: 'images/coronav.png',
      nome: 'CORONAVAC',
      valor: 'Primeira dose',
    ),
    Doses(
      id: '2',
      icone: 'images/aztra.png',
      nome: 'AZTRAZENECA',
      valor: 'terceira dose',
    ),
    Doses(
      id: '3',
      icone: 'images/johsson.png',
      nome: 'JOHSSON',
      valor: 'dose única',
    ),
    Doses(
      id: '4',
      icone: 'images/moder.png',
      nome: 'MODERNA',
      valor: 'Primeira dose',
    ),
    Doses(
      id: '5',
      icone: 'images/pifs.png',
      nome: 'PIFZER',
      valor: 'Primeira dose',
    ),
  ];

  // Method to read doses from vacines in firebase realtime database
}
