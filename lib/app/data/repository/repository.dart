import 'package:meta/meta.dart';
import 'package:minhas_vacinas/app/data/provider/api.dart';


class MyRepository {

final MyApiClient api;

MyRepository(this.api);

getAll(){
  return api.getAll();
}


}