import 'package:flutter/material.dart';
import 'package:minhas_vacinas/minhas_vacinas.dart';
import 'package:minhas_vacinas/models/vacin.dart';
import 'package:minhas_vacinas/pages/apipage.dart';
import 'package:minhas_vacinas/pages/vacinas_cadastro.dart';
import 'package:minhas_vacinas/repositories/vacinas_reposit.dart';
import 'package:minhas_vacinas/widges/vacina_image_card.dart';
import 'package:minhas_vacinas/widges/vacinas_grid_view.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required id}) : super(key: key);

  @override
  State<Home> createState() => _VacinasState();

  static doc(id) {}
}

class _VacinasState extends State<Home> {
  late final List<Vacin> vacinaList;

  @override
  void initState() {
    super.initState();
    vacinaList = VacinasReposit().vacina;
  }

  openDetails(Vacin vacin) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const MinhasVacinas()),
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
    const SizedBox(
    height: 100,
    child: DrawerHeader(
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
    ),
    // Home list tile linking to home.dart
    ListTile(
    leading: const Icon(Icons.home),
    title: const Text('Home'),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const Home(id: null,)),
    );
    },
    ),
    ListTile(
    // Health icon
    leading: const Icon(Icons.medical_services),
    title: const Text('Vacinas'),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const MinhasVacinas()),
    );
    },
    ),
    ListTile(
    leading: const Icon(Icons.add),
    title: const Text('Registro'),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const AddVacinaPage(
    id: null,
    )),
    );
    },
    ),
      ListTile(
              leading: const Icon(Icons.web),
              title: const Text('API'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ApiPage (
                          )),
                );
              },
            ),
    ],
    ),
    ),
      body: VacinasGridView(
        vacin: List.from(
          vacinaList.map(
                (Vacin vacin) => VacinaImageCard(
              image: vacin.icone,
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
                builder: (context) => const AddVacinaPage(
                  id: null,
                )),
          );
        },
        backgroundColor: Colors.blueGrey,
        extendedPadding: const EdgeInsets.all(50),
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