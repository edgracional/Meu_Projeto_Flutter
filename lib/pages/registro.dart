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
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(widget.doses.icone),
                      width: 250,
                    ),
                    SizedBox(
                      child: SizedBox(
                        child: Text(widget.doses.valor),
                        width: 250,
                      ),
                      width: 250,
                    ),
                    Container(width: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
