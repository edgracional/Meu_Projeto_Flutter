
import 'package:flutter/material.dart';

import '../models/teste.dart';

class Registro extends StatefulWidget {
  Doses doses;

  Registro({Key? key, required this.doses}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doses.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: <Widget>[
                  Center(
                    child: Flexible(
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              child: Image.asset(widget.doses.icone),
                            ),
                            SizedBox(
                              width: 250,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: Text(
                                    widget.doses.valor,
                                    style: const TextStyle(
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
