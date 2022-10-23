import 'package:flutter/material.dart';
import 'minhas_vacinas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MinhasVacinas());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}



