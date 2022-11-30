import 'package:get/get.dart';
import 'package:minhas_vacinas/app/data/model/model.dart';
import 'package:minhas_vacinas/app/data/repository/repository.dart';

class DadosController extends GetxController {
  final MyRepository repository;
  //injeção do repositorio no controlador
  DadosController(this.repository);
//retorna uma lista de mapa
 final _obj =  [].obs; //criar de froma reativa
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

//retorna a lista
  Future getAll() async {
    await repository.getAll().then((data) {
      obj = data;
    });
  }
}
