import 'package:flutter/material.dart';
import '../models/teste.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference ref = FirebaseDatabase.instance.ref();


class AddVacinaPage extends StatefulWidget {
  const AddVacinaPage({Key? key, required id}) : super(key: key);

  @override
  AddVacinaPageState createState() => AddVacinaPageState();
}

class AddVacinaPageState extends State<AddVacinaPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> items = ['1 dose', '2 dose', '3 dose', '4 dose', '5 dose'];
  String? selectedItem = "1 dose";

  //var nome = "";
  var marca = "";
  var doses = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  //final nomeController = TextEditingController();
  final marcaController = TextEditingController();
  final dosesController = TextEditingController();
  final nomeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    //nomeController.dispose();
    marcaController.dispose();
    dosesController.dispose();
    nomeController.dispose();
    super.dispose();
  }

  clearText() {
    //nomeController.clear();
    marcaController.clear();
    dosesController.clear();
    nomeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Vacina"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Nome: ',
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
              ),
              Container(
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
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                /*child: TextFormField(
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
                ),*/
                // Doses dropdown with dosesController
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Doses: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  value: selectedItem,
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedItem = value;
                      dosesController.text = value!;
                    });
                  },
                ),),
              /*  Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: DropdownButton<String>(
                  value: selectedItem,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            child: Text(item, style: TextStyle(fontSize: 25)),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() => selectedItem),
                ),
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Doses_Repository.getVacinas();
                      // Validate returns true if the form is valid, otherwise false.
                      String marca = marcaController.text;
                      String doses = dosesController.text;
                      String nome = nomeController.text;
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          //nome = nomeController.text;
                          marca = marcaController.text;
                          doses = dosesController.text;
                          nome = nomeController.text;
                          //addUser();
                          clearText();
                        });
                        final Doses vacina = Doses(
                          id: DateTime.now().toString(),
                          icone: "images/pifs.png",
                          nome: marca,
                          valor: doses,
                        );
                        //Add Vacin to list
                        //Doses_Repository.addVacina(vacina);
                        //Add Vacina to realtime database DatabaseReference
                        ref.child(nome).push().set({
                          "id": vacina.id,
                          "icone": vacina.icone,
                          "nome": vacina.nome,
                          "valor": vacina.valor,
                        });
                      }
                    },
                    child: const Text(
                      'Registro',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {clearText()},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                    child: const Text(
                      'Resetar',
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
