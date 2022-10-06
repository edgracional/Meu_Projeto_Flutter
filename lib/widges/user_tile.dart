/*  Aproveitamentos futuros - estudo de caso
import 'package:flutter/material.dart';
import '../models/teste.dart';
import '../repositories/teste_repository.dart';

class UserTile extends StatelessWidget {
  final Doses doses;

  const UserTile(this.doses);

  @override
  Widget build(BuildContext context) {
    final avatar = doses.icone == null || doses.icone.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(doses.icone));
    return ListTile(
      leading: avatar,
      title: Text(doses.nome),
      subtitle: Text("Doses: ${doses.valor}"),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.amber,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}*/
