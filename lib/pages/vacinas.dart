import 'package:flutter/material.dart';
import 'package:minhas_vacinas/models/vacin.dart';
import 'package:minhas_vacinas/pages/registro.dart';
import 'package:minhas_vacinas/pages/vacinas_cadastro.dart';
import 'package:minhas_vacinas/pages/vacinas_details.dart';
import 'package:minhas_vacinas/repositories/vacinas_reposit.dart';
import 'package:minhas_vacinas/widges/vacina_image_card.dart';
import 'package:minhas_vacinas/widges/vacinas_grid_view.dart';

import '../minhas_vacinas.dart';

class Vacinas extends StatefulWidget {
  const Vacinas({Key? key, required id}) : super(key: key);

  @override
  State<Vacinas> createState() => _VacinasState();

  static doc(id) {}
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Vacinas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VacinaDetailsPage(vacin: null,)),
                );
              },
            ),
            ListTile(
              title: const Text('Doses'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MinhasVacinas()),
                );
              },
            ),
            ListTile(
              title: const Text('Registro'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddVacinaPage(id: null,)),
                );
              },
            ),
          ],
        ),
        /*child: ListView(
          padding: EdgeInsets.zero,

          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),*/
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => AddVacinaPage(
                      id: null,
                    )),
          );
        },
        backgroundColor: Colors.blueGrey,
        extendedPadding: EdgeInsets.all(50),
        label: const Text(
          "Registrar Dose",
          style: TextStyle(
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
