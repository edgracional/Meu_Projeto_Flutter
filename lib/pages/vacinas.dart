import 'package:flutter/material.dart';
import 'package:minhas_vacinas/models/vacin.dart';
import 'package:minhas_vacinas/pages/vacinas_cadastro.dart';
import 'package:minhas_vacinas/provider/vacinas_provider.dart';
import 'package:minhas_vacinas/repositories/vacinas_reposit.dart';
import 'package:provider/provider.dart';
import 'package:minhas_vacinas/pages/showdetails.dart';
import 'package:minhas_vacinas/pages/home.dart';

import '../minhas_vacinas.dart';
import 'apipage.dart';

class Vacinas extends StatefulWidget {
  const Vacinas({Key? key, required id}) : super(key: key);

  @override
  State<Vacinas> createState() => _VacinasState();

  // static doc(id) {}
}

class _VacinasState extends State<Vacinas> {
  late final List<Vacin> vacinaList;
  late VacinasProvider vacinasProvider;
  @override
  void initState() {
    super.initState();
    vacinaList = VacinasReposit().vacina;

    /// for loading data as soon as the page loads
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      vacinasProvider = Provider.of<VacinasProvider>(context, listen: false);
      await vacinasProvider.getVacinasList();
    });
  }

  /*openDetails(Vacin vacin) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => VacinaDetailsPage(vacin: vacin)),
    );
  }*/

  //Open details from ShowDetails
  openDetails(Vacin vacin) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ShowDetails(vacin: vacin)),
    );
  }

  /*registro(Doses doses) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Registro(vacin: vacin)));
  }*/

  @override
  Widget build(BuildContext context) {
    // print("object");
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
      body: Consumer<VacinasProvider>(
        builder: (context, value, child) => value.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : value.vacinList.isEmpty
                ? const Center(
                    child: Text("No Data found"),
                  )
                : ListView.builder(
                    itemCount: value.vacinList.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: Image.asset(value.vacinList[index].icone),
                      title: Text(
                        value.vacinList[index].nome!.substring(0, 1).toUpperCase() +
                            value.vacinList[index].nome!.substring(1),
                      ),
                      // ontap
                      onTap: () => openDetails(value.vacinList[index]),
                      // Ontap
                    ),
                  ),
      ),
    );
  }
}
