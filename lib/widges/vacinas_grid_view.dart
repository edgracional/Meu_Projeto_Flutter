import 'package:flutter/material.dart';

class VacinasGridView extends StatelessWidget {
  final List<Widget> vacin;

  const VacinasGridView({
    Key? key,
    required this.vacin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 4,
        children: vacin,
      ),
    );
  }
}
