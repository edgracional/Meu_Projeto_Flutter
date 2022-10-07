import 'package:flutter/material.dart';
import 'package:minhas_vacinas/models/teste.dart';
import 'package:minhas_vacinas/pages/registro.dart';




import '../pages/vacinas.dart';
import '../models/vacin.dart';
import '../repositories/teste_repository.dart';

class VacinaDetailsPage extends StatefulWidget {
  final Vacin vacin;

  const VacinaDetailsPage({
    Key? key,
    required this.vacin,
  }) : super(key: key);

  @override
  VacinaDetailsPageState createState() => VacinaDetailsPageState();
}

class VacinaDetailsPageState extends State<VacinaDetailsPage> {
  static const String _title = 'Minhas Vacinas';

  final tabela = Doses_Repository.tabela;

  List<Doses> selecionadas = [];

  appBarDinamica() {
    return AppBar(
      title: const Text('Dosess'),
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const Vacinas(
                      id: null,
                    )),
          );
        },
      ),
    );
  }

  registro(Doses doses) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Registro(doses: doses)));
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        title: _title,
        home: Scaffold(
          appBar: appBarDinamica(),
          body: ListView.separated(
            itemBuilder: (BuildContext context, int doses) {
              return ListTile(
                leading: SizedBox(
                  width: 50,
                  child: Image.asset(tabela[doses].icone),
                ),
                title: Text(tabela[doses].nome),
                trailing: Text(tabela[doses].valor.toString()),
                selected: selecionadas.contains(tabela[doses]),
                selectedTileColor: Colors.cyan[50],
                onLongPress: () {
                  setState(() {
                    (selecionadas.contains(tabela[doses]))
                        ? selecionadas.remove(tabela[doses])
                        : selecionadas.add(tabela[doses]);
                  });
                },
                onTap: () => registro(tabela[doses]),
              );
            },
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tabela.length,
          ),
        ));
    return materialApp;
  }
}

/*  
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/
