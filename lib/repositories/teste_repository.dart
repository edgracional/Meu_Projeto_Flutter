import 'package:minhas_vacinas/models/teste.dart';

class DosesRepository {
  static List<Doses> tabela = [
    Doses(
      id: '1',
      icone: 'images/coronav.png',
      nome: 'CORONAVAC',
      sigla: '',
      valor: 'Primeira dose',
    ),
    Doses(
      id: '2',
      icone: 'images/aztra.png',
      nome: 'AZTRAZENECA',
      sigla: '',
      valor: 'terceira dose',
    ),
    Doses(
      id: '3',
      icone: 'images/johsson.png',
      nome: 'JOHSSON',
      sigla: '',
      valor: 'dose única',
    ),
    Doses(
      id: '4',
      icone: 'images/moder.png',
      nome: 'MODERNA',
      sigla: '',
      valor: 'Primeira dose',
    ),
    Doses(
      id: '5',
      icone: 'images/pifs.png',
      nome: 'PIFZER',
      sigla: '',
      valor: 'Primeira dose',
    ),
  ];
}
