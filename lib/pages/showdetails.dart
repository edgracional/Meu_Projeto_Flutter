import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/vacin.dart';


// Page to show details of a vacin with a name and icon in the center
class ShowDetails extends StatelessWidget {
  final Vacin vacin;

  const ShowDetails({Key? key, required this.vacin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vacin.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              // Icon
              [
            SizedBox(
              width: 350,
              child: Image.asset(vacin.icone),
            ),
            Text(
              vacin.nome ?? '',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              vacin.valor ?? '',
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                Share.share(
                    '#Vacinado: ${vacin.nome} - ${vacin.valor}');
              },
              child: const Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}
