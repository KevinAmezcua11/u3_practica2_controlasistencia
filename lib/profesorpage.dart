import 'package:flutter/material.dart';

class ProfesorPage extends StatefulWidget {
  const ProfesorPage({super.key});

  @override
  State<ProfesorPage> createState() => _ProfesorPageState();
}

class _ProfesorPageState extends State<ProfesorPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Profesor")
      ],
    );
  }
}

