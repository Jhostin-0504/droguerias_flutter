import 'dart:convert';

Preguntas preguntasFromJson(String str) => Preguntas.fromJson(json.decode(str));
String preguntasToJson(Preguntas data) => json.encode(data.toJson());

class Preguntas {
  Preguntas({
    required this.preguntas,
    required this.turnos,
  });
  List<Pregunta> preguntas;
  List<Turno> turnos;
  factory Preguntas.fromJson(Map<String, dynamic> json) => Preguntas(
        preguntas: List<Pregunta>.from(
            json["preguntas"].map((x) => Pregunta.fromJson(x))),
        turnos: List<Turno>.from(json["turnos"].map((x) => Turno.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "preguntas": List<dynamic>.from(preguntas.map((x) => x.toJson())),
        "turnos": List<dynamic>.from(turnos.map((x) => x.toJson())),
      };
}

class Pregunta {
  Pregunta({
    required this.id,
    required this.pregunta,
    required this.tipoRespuesta,
    required this.orden,
    required this.opcionesRespuesta,
  });
  int id;
  String pregunta;
  int tipoRespuesta;
  int orden;
  List<OpcionesRespuesta> opcionesRespuesta;
  factory Pregunta.fromJson(Map<String, dynamic> json) => Pregunta(
        id: json["id"],
        pregunta: json["pregunta"],
        tipoRespuesta: json["tipoRespuesta"],
        orden: json["orden"],
        opcionesRespuesta: List<OpcionesRespuesta>.from(
            json["opcionesRespuesta"]
                .map((x) => OpcionesRespuesta.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "pregunta": pregunta,
        "tipoRespuesta": tipoRespuesta,
        "orden": orden,
        "opcionesRespuesta":
            List<dynamic>.from(opcionesRespuesta.map((x) => x.toJson())),
      };
}

class OpcionesRespuesta {
  OpcionesRespuesta({
    required this.id,
    required this.etiqueta,
    required this.estado,
  });
  int id;
  String etiqueta;
  int estado;
  factory OpcionesRespuesta.fromJson(Map<String, dynamic> json) =>
      OpcionesRespuesta(
        id: json["id"],
        etiqueta: json["etiqueta"],
        estado: json["estado"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "etiqueta": etiqueta,
        "estado": estado,
      };
}

class Turno {
  Turno({
    required this.id,
    required this.etiquetaTurno,
    required this.horaInicio,
    required this.horaFinal,
  });
  int id;
  String etiquetaTurno;
  String horaInicio;
  String horaFinal;
  factory Turno.fromJson(Map<String, dynamic> json) => Turno(
        id: json["id"],
        etiquetaTurno: json["etiquetaTurno"],
        horaInicio: json["horaInicio"],
        horaFinal: json["horaFinal"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "etiquetaTurno": etiquetaTurno,
        "horaInicio": horaInicio,
        "horaFinal": horaFinal,
      };
}
