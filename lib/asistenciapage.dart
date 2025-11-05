import 'package:flutter/material.dart';
import 'package:u3_practica2_controlasistencia/asistencia.dart';
import 'package:u3_practica2_controlasistencia/basedatos.dart';

class AsistenciaPage extends StatefulWidget {
  const AsistenciaPage({super.key});

  @override
  State<AsistenciaPage> createState() => _AsistenciaPageState();
}

class _AsistenciaPageState extends State<AsistenciaPage> {
  final nhorario = TextEditingController();
  final fecha = TextEditingController();
  final asistencia = TextEditingController();

  int asistenciaValue = 1;

  List<Asistencia> datos = [];

  void actualizarLista() async {
    List<Asistencia> temp = await DB.mostrarAsistencias();

    setState(() {
      datos = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    actualizarLista();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              Text("Ingrese los datos siguientes:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          TextField(
            controller: nhorario,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "ID Horario",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16,),
          TextField(
            controller: fecha,
            decoration: InputDecoration(
              labelText: "Fecha (AAAA-MM-DD)",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Asistencia:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  )
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text("Sí"),
                      value: 1,
                      groupValue: asistenciaValue,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          asistenciaValue = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text("No"),
                      value: 0,
                      groupValue: asistenciaValue,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          asistenciaValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    if (nhorario.text.trim().isEmpty || fecha.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Debe llenar todos los campos",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          backgroundColor: Colors.black,
                        ),
                      );
                      return;
                    }

                    int horario = int.tryParse(nhorario.text) ?? 0;

                    Asistencia a = Asistencia(
                      NHORARIO: horario,
                      FECHA: fecha.text,
                      ASISTENCIA: asistenciaValue,
                    );

                    DB.insertarAsistencia(a).then((res) {
                      if(res <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error al registrar asistencia",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Asistencia registrada correctamente",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        actualizarLista();
                        nhorario.clear();
                        fecha.clear();
                        setState(() {
                          asistenciaValue = 1;
                        });
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outlined),
                      SizedBox(width: 6,),
                      Text("Registrar asistencia",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            letterSpacing: 1.5
                        ),),
                    ],
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              FilledButton(
                onPressed: () {
                  nhorario.clear();
                  fecha.clear();
                  setState(() {
                    asistenciaValue = 1;
                  });
                },
                child: Icon(Icons.cleaning_services_rounded),
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.black
                ),
              )
            ],
          ),

          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),

          Row(
            children: [
              Text("Registro de Asistencias:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
                itemCount: datos.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.checklist_rtl, color: Colors.black87),
                          backgroundColor: Colors.blueGrey[100],
                          radius: 22,
                        ),
                        title: Text("ID: ${datos[i].IDASISTENCIA ?? '-'}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Horario: ${datos[i].NHORARIO}"),
                            Text("Fecha: ${datos[i].FECHA}"),
                            Text("Asistencia: ${datos[i].ASISTENCIA == 1 ? 'Sí' : 'No'}"),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            DB.eliminarAsistencia(datos[i].IDASISTENCIA!)
                                .then((res) {
                              actualizarLista();
                            });
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
