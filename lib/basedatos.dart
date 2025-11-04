import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:u3_practica2_controlasistencia/profesor.dart';
import 'package:u3_practica2_controlasistencia/asistencia.dart';

class DB {
  static Future<Database> _conexion() async {
    return openDatabase(
      join(await getDatabasesPath(), "base1.db"),
      version: 1,
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
      onCreate: (db, version) async {
          await db.execute("CREATE TABLE PROFESOR("
              "NPROFESOR TEXT PRIMARY KEY,"
              "NOMBRE TEXT,"
              "CARRERA TEXT"
              ")");
          
          await db.execute("CREATE TABLE MATERIA("
              "NMAT TEXT PRIMARY KEY,"
              "DESCRIPCION TEXT"
              ")");
          
          await db.execute("CREATE TABLE HORARIO("
              "NHORARIO INTEGER PRIMARY KEY AUTOINCREMENT,"
              "NPROFESOR TEXT,"
              "NMAT TEXT,"
              "HORA TEXT,"
              "EDIFICIO TEXT,"
              "SALON TEXT,"
              "FOREIGN KEY (NPROFESOR) REFERENCES PROFESOR(NPROFESOR) ON DELETE CASCADE ON UPDATE CASCADE,"
              "FOREIGN KEY (NMAT) REFERENCES MATERIA(NMAT) ON DELETE CASCADE ON UPDATE CASCADE"
              ")");

          await db.execute("CREATE TABLE ASISTENCIA("
              "IDASISTENCIA INTEGER PRIMARY KEY AUTOINCREMENT,"
              "NHORARIO INTEGER,"
              "FECHA TEXT,"
              "ASISTENCIA INTEGER,"
              "FOREIGN KEY(NHORARIO) REFERENCES HORARIO(NHORARIO) ON DELETE CASCADE ON UPDATE CASCADE"
              ")");
      }
    );
  }

  // PROFESOR
  static Future<int> insertarProfesor(Profesor p) async {
    Database base = await _conexion();

    return base.insert("PROFESOR", p.toJSON());
  }

  static Future<List<Profesor>> mostrarProfesores() async {
    Database base = await _conexion();

    List<Map<String, dynamic>> temp = await base.query("PROFESOR");

    return List.generate(
        temp.length,
        (contador) {
          return Profesor(
              NPROFESOR: temp[contador]['NPROFESOR'],
              NOMBRE: temp[contador]['NOMBRE'],
              CARRERA: temp[contador]['CARRERA']
          );
        }
    );
  }

  static Future<int> actualizarProfesor(Profesor p) async {
    Database base = await _conexion();

    return base.update("PROFESOR", p.toJSON(), where: "NPROFESOR = ?", whereArgs: [p.NPROFESOR]);
  }

  static Future<int> eliminarProfesor(String NPROFESOR) async {
    Database base = await _conexion();

    return base.delete("PROFESOR", where: "NPROFESOR = ?", whereArgs: [NPROFESOR]);
  }

  // ASISTENCIA
  static Future<int> insertarAsistencia(Asistencia a) async {
    Database base = await _conexion();

    return base.insert("ASISTENCIA", a.toJSON());
  }

  static Future<List<Asistencia>> mostrarAsistencias() async {
    Database base = await _conexion();

    List<Map<String, dynamic>> temp = await base.query("ASISTENCIA");

    return List.generate(
        temp.length,
            (contador) {
          return Asistencia(
              IDASISTENCIA: temp[contador]['IDASISTENCIA'],
              NHORARIO: temp[contador]['NHORARIO'],
              FECHA: temp[contador]['FECHA'],
              ASISTENCIA: temp[contador]['ASISTENCIA']
          );
        }
    );
  }

  static Future<int> actualizarAsistencia(Asistencia a) async {
    Database base = await _conexion();

    return base.update("ASISTENCIA", a.toJSON(), where: "IDASISTENCIA = ?", whereArgs: [a.IDASISTENCIA]);
  }

  static Future<int> eliminarAsistencia(int IDASISTENCIA) async {
    Database base = await _conexion();

    return base.delete("ASISTENCIA", where: "IDASISTENCIA = ?", whereArgs: [IDASISTENCIA]);
  }
}