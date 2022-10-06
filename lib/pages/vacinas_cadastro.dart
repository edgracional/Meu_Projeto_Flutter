import 'package:flutter/material.dart';

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
  final marcaController = TextEditingController();
  final dosesController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    //nomeController.dispose();
    marcaController.dispose();
    dosesController.dispose();
    super.dispose();
  }

  clearText() {
    //nomeController.clear();
    marcaController.clear();
    dosesController.clear();
  }

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
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          //nome = nomeController.text;
                          marca = marcaController.text;
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
