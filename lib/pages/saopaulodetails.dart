import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SaoPauloDetailsPage extends StatefulWidget {
  const SaoPauloDetailsPage({Key? key, required this.state}) : super(key: key);

  final String state;

  @override
  _SaoPauloDetailsPageState createState() => _SaoPauloDetailsPageState();
}

class _SaoPauloDetailsPageState extends State<SaoPauloDetailsPage> {
  String data = '';
  Map dataitems = {};

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse(
          "https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/${widget.state}"),
        headers: {"Accept": "application/json"});
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      data = response.body;
      dataitems = json.decode(data);
      dataitems.remove('uid');
    });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${widget.state.toUpperCase()}'),
      ),
      body: ListView.builder(
        itemCount: dataitems == null ? 0 : dataitems.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      dataitems.keys.elementAt(index) +
                          ': ' +
                          dataitems.values.elementAt(index).toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


