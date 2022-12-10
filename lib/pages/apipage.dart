import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'saopaulodetails.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late List data = [];

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://covid19-brazil-api.now.sh/api/report/v1"),
        headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(response.body)['data'];
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
        title: const Text('Covid nos Estados'),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaoPauloDetailsPage(
                            state: data[index]['uf'].toLowerCase(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(data[index]["state"]),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}