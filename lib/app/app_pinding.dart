import 'dart:html';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:minhas_vacinas/app/data/provider/api.dart';
import 'package:minhas_vacinas/app/data/repository/repository.dart';
import 'package:minhas_vacinas/app/modules/dados/dados_controller.dart';

class AppPageBinding implements Bindings {
  @override
  void dependencies() {
    //puxar o DadosController
    Get.lazyPut<DadosController>(
      
        //DadosController vai puxar o repositório MyRepository
        () => DadosController(MyRepository(
            //vai injetar o repositório http
           MyApiClient(httpClient: Dio()),
            )));
  }
}
