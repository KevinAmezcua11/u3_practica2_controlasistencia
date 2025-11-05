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
          padding: EdgeInsets.all(25),
          children: [
            Text("¡Bienvenido al sistema de control de asistencia!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),

            SizedBox(height: 10),

            Text("Administra profesores, horarios y asistencias de manera fácil y rápida desde un solo lugar.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 10,),

            Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ver materias",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text("Consulta y edita",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          icon: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 140,
                      height: 100,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            index = 0;
                          });
                        },
                          icon: Image.asset("assets/materias.png",
                            width: 75,
                            height: 75,
                          ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ver horarios",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text("Consulta y modifica",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          icon: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 140,
                      height: 100,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            index = 1;
                          });
                        },
                        icon: Image.asset("assets/horario.png",
                          width: 85,
                          height: 85,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ver profesores",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text("Consulta y actualiza",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index = 3;
                            });
                          },
                          icon: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 140,
                      height: 100,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            index = 3;
                          });
                        },
                        icon: Image.asset("assets/profesor.png",
                          width: 85,
                          height: 85,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ver asistencias",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text("Consulta y registra",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index = 4;
                            });
                          },
                          icon: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 140,
                      height: 100,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            index = 4;
                          });
                        },
                        icon: Image.asset("assets/asistencia.png",
                          width: 85,
                          height: 85,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),
            Divider(thickness: 1.2),
            SizedBox(height: 8),

            Text("Consultas:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            Text("Profesores que imparten clase a las 8:00 a.m. en el edificio UD:",
              style: TextStyle(
                fontSize: 16
              ),
            ),
            SizedBox(height: 10),
            Text("Profesores que asistieron a clase el día 08/02/2022:",
              style: TextStyle(
                  fontSize: 16
              ),
            ),
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
