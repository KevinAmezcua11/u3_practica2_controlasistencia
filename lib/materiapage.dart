import 'package:flutter/material.dart';

class Materiapage extends StatefulWidget {
  const Materiapage({super.key});

  @override
  State<Materiapage> createState() => _MateriapageState();
}

class _MateriapageState extends State<Materiapage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Materias")
      ],
    );
  }
}

