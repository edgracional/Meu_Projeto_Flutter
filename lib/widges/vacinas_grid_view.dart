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
      padding: const EdgeInsets.all(12),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 35,
        crossAxisSpacing: 35,
        childAspectRatio: 3 / 4,
        children: vacin,
      ),
    );
  }
}
