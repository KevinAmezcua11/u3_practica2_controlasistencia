class Asistencia {
  int IDASISTENCIA;
  int NHORARIO;
  String FECHA;
  bool ASISTENCIA;

  Asistencia({
    required this.IDASISTENCIA,
    required this.NHORARIO,
    required this.FECHA,
    required this.ASISTENCIA
  });

  Map<String, dynamic> toJSON() {
    return {
      'IDASISTENCIA': IDASISTENCIA,
      'NHORARIO': NHORARIO,
      'FECHA': FECHA,
      'ASISTENCIA': ASISTENCIA
    };
  }
}