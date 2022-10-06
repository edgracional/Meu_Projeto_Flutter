//Controlar lista de usuário - map de usuário - add usuário etc;
/* Aproveitamentos futuros - estudo de caso  

import 'dart:math';

import 'package:flutter/material.dart';
import '../models/teste.dart';
import '../repositories/teste_repository.dart';

class Users with ChangeNotifier {
  final Map<String, Doses> _items =
      {...Doses_Repository.tabela} as Map<String, Doses>;

//retorna as vacinas.
  List<Doses> get all {
    return [..._items.values];
  }

//retorna a quantidade
  int get count {
    return _items.length;
  }

  Doses byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(Doses doses) {
    if (doses == null) {
      return;
    }

    if (doses.id != null &&
        doses.id.trim().isNotEmpty &&
        _items.containsKey(doses.id)) {
          //entrará na condição se o id for diferente de nulo
      _items.update(
        doses.id,
        (_) => Doses(
          id: doses.id,
          nome: doses.nome,
          icone: doses.icone,
          valor: doses.valor,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => Doses(
          id: doses.id,
          nome: doses.nome,
          icone: doses.icone,
          valor: doses.valor,
        ),
        );
        notifyListeners();//notifica o provider e atualiza a aplicação.
    }
    void remove(Doses doses){
      if(doses != null && doses.id != null){
        _items.remove(doses.id);
        notifyListeners();
      }
    }
  }
}*/
