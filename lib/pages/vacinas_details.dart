import 'package:flutter/material.dart';
import 'package:minhas_vacinas/pages/update_vacina.dart';

import 'package:minhas_vacinas/pages/vacinas_cadastro.dart';
import '../repositories/vacinas_reposit.dart';

import '../pages/vacinas.dart';
import '../models/vacin.dart';

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

  
  // updateScreen() {
  //   setState(() {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: const Text('Comentário adicionado!'),
  //         action: SnackBarAction(
  //           label: 'OK',
  //           onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
  //         ),
  //       ),
  //     );
  //   });
  // }

  ValueNotifier<bool> showDescription = ValueNotifier(true);

  /* validações futuras 
   final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  // For Deleting User
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }*/


  //final Stream<QuerySnapshot> studentsStream =
     // FirebaseFirestore.instance.collection('students').snapshots();

  // For Deleting User
 // CollectionReference students =
     // FirebaseFirestore.instance.collection('vacinas');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return Vacinas
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));

  @override
  Widget build(BuildContext context) {
    var storedocs;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.vacin.name),
        elevation: 0,
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          /*  SizedBox(
            width: double.infinity,
            child: Image.asset(
              widget.vacin.image,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                //espaçamento e card com a descrição da vacina
                const SizedBox(height: 300),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(widget.vacin.description),
                  ),
                ),

                Card(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(140),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text(
                              'Nome',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text(
                              'Marca',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['nome'],
                                  style: const TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['dose'],
                                  style: const TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    /*  */MaterialPageRoute(
                                      builder: (context) => Vacinas(
                                          key: storedocs[i]['id']),
                                    ),
                                  )
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    {deleteUser(storedocs[i]['id'])},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
                  ),
                )
                ),
              ],
          ),
          ),
        ]
      
  ),
  
  );
  }}
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  
  
}