import 'package:flutter/material.dart';
import 'package:u3_practica2_controlasistencia/asistenciapage.dart';
import 'package:u3_practica2_controlasistencia/horariopage.dart';
import 'package:u3_practica2_controlasistencia/materiapage.dart';
import 'package:u3_practica2_controlasistencia/profesorpage.dart';

class programa extends StatefulWidget {
  const programa({super.key});

  @override
  State<programa> createState() => _programaState();
}

class _programaState extends State<programa> {
  int index = 2;

  List titulosAppBar = [
    "Materias",
    "Horario de clases",
    "Inicio",
    "Profesores",
    "Asistencia",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulosAppBar[index]),
        centerTitle: true,
      ),

      body: contenido(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: "Materia",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_outlined),
            activeIcon: Icon(Icons.access_time_filled_sharp),
            label: "Horario",
          ),

          BottomNavigationBarItem(
            icon: CircleAvatar(
              child: Icon(Icons.home_outlined, color: Colors.grey,),
              backgroundColor: Colors.grey[200],
            ),
            activeIcon: CircleAvatar(
              child: Icon(Icons.home_outlined, color: Colors.white,),
              backgroundColor: Colors.blue,
            ),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profesor",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            activeIcon: Icon(Icons.check_circle),
            label: "Asistencia",
          ),
        ],

        onTap: (x) {
          setState(() {
            index = x;
          });
        },

        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 11,
      ),
    );
  }

  Widget? contenido() {
    switch(index) {
      case 0:
        return Materiapage();

      case 1:
        return HorarioPage();

      case 2:
        return ListView(
          children: [
            Text("Home")
          ],
        );

      case 3:
        return ProfesorPage();

      case 4:
        return AsistenciaPage();
        
      default:
        return Center(child: Text("No existe esta página."),);
    }
  }
}
