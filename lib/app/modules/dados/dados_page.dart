import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhas_vacinas/app/modules/dados/dados_controller.dart';

class DadosPage extends GetView<DadosController> {
  const DadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Covid-19')),
      body: GetX<DadosController>(
        //inicializa o controlador pegando todos os dados
        initState: (state) {
          Get.find<DadosController>().getAll();
        },
        builder: (_) {
          //verifica se puxou todos os dados
          return _.obj.lenght < 1
              ? const Center(
                  child: CircularProgressIndicator(),
                )

              //se tiver dados vai carregar
              : ListView.builder(
                  itemCount: _.obj.lenght,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_.obj[index].state),
                      subtitle: Text(
                          'Casos: ${_.obj[index].cases}; Mortes: ${_.obj[index].cases}'),
                    );
                  });
        },
      ),
    );
  }
}
