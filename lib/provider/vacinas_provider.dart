import 'package:flutter/cupertino.dart';
import 'package:minhas_vacinas/models/vacin.dart';
import 'package:minhas_vacinas/repositories/realtime_database.dart';

class VacinasProvider extends ChangeNotifier {
  List<Vacin> vacinList = [];
  bool isBusy = false;
  RealtimeDatabase realtimeDatabase = RealtimeDatabase();
  setBusy(bool val) {
    isBusy = val;
    notifyListeners();
  }

  Future<void> getVacinasList() async {
    setBusy(true);
    List<Vacin> list = await realtimeDatabase.getAllVacinas();

    if (list.isNotEmpty) {
      vacinList = list;
    }
    setBusy(false);
  }
}
