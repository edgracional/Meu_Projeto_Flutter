/*  import 'package:flutter/material.dart';

import '../models/vacin.dart';

class VacinaRegisterPage extends StatefulWidget {
  final Vacin vacin;

  const VacinaRegisterPage({
    Key? key,
    required this.vacin,
  }) : super(key: key);

  @override
  State<VacinaRegisterPage> createState() => _VacinaRegisterPageState();
}

class _VacinaRegisterPageState extends State<VacinaRegisterPage> {
  var selected = 1;
  final dropdownList = <int>[1, 2, 3, 4, 5];
  var isChecked = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  extendBodyBehindAppBar: true,
      appBar: AppBar(
         title: Text(widget.vacin.name),
        elevation: 0,
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
      ),*/
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              widget.vacin.image,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
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
                const SizedBox(height: 10),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: Text(widget.vacin.year.toString()),
                      ),
                      Card(
                        child: Column(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (val) {
                                setState(() {
                                  if (val != null) isChecked = val;
                                });
                              },
                            ),
                            DropdownButton(
                              value: selected,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 25,
                              style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 30,
                              ),
                              underline: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              items: dropdownList
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e.toString())))
                                  .toList(),
                              onChanged: (int? val) {
                                setState(() {
                                  if (val != null) selected = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: const Icon(Icons.add_comment_rounded),
      // ),
    );
  }
}*/
