import 'package:flutter/material.dart';
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
  _VacinaDetailsPageState createState() => _VacinaDetailsPageState();
}

class _VacinaDetailsPageState extends State<VacinaDetailsPage> {
  static const String _title = 'Flutter Code Sample';
  final tabela = MoedaRepository.tabela;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: ListView.separated(
            itemBuilder: (
              BuildContext context, int moeda) {
                return ListTile(
                  leading: Image.asset(tabela[moeda].icone),
                  title: Text(tabela[moeda].nome),
                  trailing: Text(tabela[moeda].valor.toString()),
                );
              },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, __) => Divider() ,
            itemCount: tabela.length,
      ),
    ));
  }
}

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
}
