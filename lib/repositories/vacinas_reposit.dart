import 'package:minhas_vacinas/models/vacin.dart';

class VacinasReposit {
  List<Vacin> vacina = [];

  VacinasReposit() {
    vacina = [
      Vacin(
        id: 0,
        name: 'Doses',
        image: 'images/vacindoses.png',
        genre: ['VACINAS'],
        description: 'Controle de vacinação Corona-Vírus',
        year: 2020,
      ),

      /* 
    Vacin(
      id: 1,
      name: 'Pfizer',
      image: 'images/pifs.png',
      genre: ['VACINAS'],
      description: 'Vacinação contra epidemia de Corona-Vírus',
      year: 2021,
    ),
    
    Vacin(
      id: 2,
      name: 'Moderna',
      image: 'images/moder.png',
      genre: ['VACINAS'],
      description: 'Vacinação contra epidemia de Corona-Vírus',
      year: 2021,
    ),
    Vacin(
      id: 3,
      name: 'Coronavac',
      image: 'images/coronav.png',
      genre: ['VACINAS'],
      description: 'Vacinação contra epidemia de Corona-Vírus',
      year: 2021,
    ),
    Vacin(
      id: 4,
      name: 'Johnsson´s&Johnsson´s',
      image: 'images/johsson.png',
      genre: ['VACINAS'],
      description: 'Vacinação contra epidemia de Corona-Vírus',
      year: 2022,
    ),
    Vacin(
      id: 5,
      name: 'aaaaa',
      image: 'images/johsson.png',
      genre: ['VACINAS'],
      description: 'Vacinação contra epidemia de Corona-Vírus',
      year: 2022,
    ), */
    ];
  }
}
