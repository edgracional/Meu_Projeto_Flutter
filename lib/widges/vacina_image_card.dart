import 'package:flutter/material.dart';
import 'package:minhas_vacinas/models/vacin.dart';

class VacinaImageCard extends StatelessWidget {
  final Vacin vacin;
  final VoidCallback onTap;

  const VacinaImageCard({
    Key? key,
    required this.vacin,
    required this.onTap,
    required String image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: AssetImage(vacin.image),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withOpacity(.5),
          highlightColor: Colors.white.withOpacity(.1),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10),
            child: Container(
              alignment: Alignment.topRight,
              decoration: const BoxDecoration(),
            ),
          ),
        ),
      ),
    );
  }
}
