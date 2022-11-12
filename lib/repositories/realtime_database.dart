import 'package:firebase_database/firebase_database.dart';
import 'package:minhas_vacinas/Utils/object_utils.dart';
import 'package:minhas_vacinas/models/vacin.dart';

const String vacinaPath = "Vacinas";

class RealtimeDatabase {
  DatabaseReference realtimeDb = FirebaseDatabase.instance.ref();
  Future<List<Vacin>> getAllVacinas() async {
    List<Vacin> vacina = [];
    try {
      var result = await realtimeDb.child(vacinaPath).get();
      if (result.exists) {
        List<Map> list = objectToMapList(result.value as Map);
        for (var i = 0; i < list.length; i++) {
          vacina.add(Vacin.fromMap(list[i] as Map<String, dynamic>));
        }
      }
      return vacina;
    } catch (e) {
      return vacina;
    }
  }
}
