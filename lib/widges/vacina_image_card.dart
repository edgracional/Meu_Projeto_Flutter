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
          splashColor: Theme.of(context).primaryColor.withOpacity(.2),
          highlightColor: Colors.white.withOpacity(.3),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10),
            child: Container(
              alignment: Alignment.topRight,
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  color: Colors.black87,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1, left: 1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
