import 'package:flutter/material.dart';

class VacinaCard extends StatelessWidget {
  final String image;
  final String name;
  final int year;

  const VacinaCard({
    Key? key,
    required this.image,
    required this.name,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //dentro do child tem uma linha
      child: Row(
        children: [
          //imagem
          Image.asset(
            image,
            width: 100,
          ),
          //espaçamento do item à direita
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              //separa os itens (textos) em colunas
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    year.toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
