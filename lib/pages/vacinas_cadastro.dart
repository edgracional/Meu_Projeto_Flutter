import 'package:flutter/material.dart';

import 'dart:ui' show lerpDouble;
import 'package:flutter/widgets.dart';

class AddVacinaPage extends StatefulWidget {
  const AddVacinaPage({Key? key, required id}) : super(key: key);

  @override
  _AddVacinaPageState createState() => _AddVacinaPageState();
}

class _AddVacinaPageState extends State<AddVacinaPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> items = ['1 dose', '2 dose', '3 dose', '4 dose', '5 dose'];
  String? selectedItem = "1 dose";

  //var nome = "";
  var marca = "";
  var doses = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  //final nomeController = TextEditingController();
  final localController = TextEditingController();
  final dosesController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    //nomeController.dispose();
    localController.dispose();
    dosesController.dispose();
    super.dispose();
  }

  clearText() {
    //nomeController.clear();
    localController.clear();
    dosesController.clear();
  }

  String? _Selected;

  List<Map> _myJson = [
    {
      'id': 1,
      'image': 'images/aztra.png',
      'name': 'Aztrazeneca',
    },
    {
      'id': 2,
      'image': 'images/coronav.png',
      'name': 'Coronavac',
    },
    {
      'id': 3,
      'image': 'images/johsson.png',
      'name': 'Johnson&Johnsson',
    },
    {
      'id': 4,
      'image': 'images/moder.png',
      'name': 'Moderna',
    },
    {
      'id': 5,
      'image': 'images/pifs.png',
      'name': 'Pifzer',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Vacina"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              /*   Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nomeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'INSIRA SEU NOME';
                    }
                    return null;
                  },
                ),
              ),*/
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            hint: Text('Selecionar Vacina'),
                            value: _Selected,
                            onChanged: (newValue) {
                              setState(() {
                                _Selected = newValue;
                              });
                            },
                            items: _myJson.map((e) {
                              return DropdownMenuItem<String>(
                                  value: e['name'],
                                  child: Row(
                                    children: [
                                      Image.asset(e['image'], width: 25),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(e['name']),
                                      )
                                    ],
                                  ));
                            }).toList(),
                          ),
                        ),
                      ))
                    ],
                  ),
                  /*  controller: marcaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'INSIRA A MARCA';
                    }
                    return null;
                  },*/
                ),
              ),
              /*   Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Vacina: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: marcaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'INSIRA A MARCA';
                    }
                    return null;
                  },
                ),
              ),*/
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Local de Vacinação: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: localController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'INSIRA O LOCAL DE VACINAÇÃO';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Doses: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: dosesController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'INSIRA A DOSES';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          //nome = nomeController.text;
                          marca = localController.text;
                          doses = dosesController.text;
                          //addUser();
                          clearText();
                        });
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {clearText()},
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
