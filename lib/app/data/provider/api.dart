import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:minhas_vacinas/app/data/model/model.dart';

//urlda api que vamos utilizar
const baseUrl = 'https://covid19-brazil-api.vercel.app/api/report/v1';

//Classe responsável por encapsular todoo método http
class MyApiClient {
  final Dio httpClient;
  MyApiClient({required this.httpClient});

//Função que vai puxar os dados da api e vai transformar em uma lista de Data
  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.data);
        //irá trazer umalista de data
        List<Data> listMyModel = jsonResponse['data'].map<Data>((map) {
          return Data.fromJson(map);
        }).toList();
        return listMyModel;
      } else {
        print('erro -get');
      }
    } catch (_) {}
  }
}
