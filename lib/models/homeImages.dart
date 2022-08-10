import 'dart:convert';

HomeImages homeImagesFromJson(String str) =>
    HomeImages.fromJson(json.decode(str));
String homeImagesToJson(HomeImages data) => json.encode(data.toJson());

class HomeImages {
  HomeImages({
    required this.elRecursoExiste,
    required this.mensaje,
    required this.hayExcepcion,
    required this.mensajeExcepcion,
    required this.respuestaRecurso,
  });

  bool elRecursoExiste;
  String mensaje;
  bool hayExcepcion;
  String mensajeExcepcion;
  RespuestaRecurso respuestaRecurso;

  factory HomeImages.fromJson(Map<String, dynamic> json) => HomeImages(
        elRecursoExiste: json["elRecursoExiste"],
        mensaje: json["mensaje"],
        hayExcepcion: json["hayExcepcion"],
        mensajeExcepcion: json["mensajeExcepcion"],
        respuestaRecurso: RespuestaRecurso.fromJson(json["respuestaRecurso"]),
      );

  Map<String, dynamic> toJson() => {
        "elRecursoExiste": elRecursoExiste,
        "mensaje": mensaje,
        "hayExcepcion": hayExcepcion,
        "mensajeExcepcion": mensajeExcepcion,
        "respuestaRecurso": respuestaRecurso.toJson(),
      };
}

class RespuestaRecurso {
  RespuestaRecurso({
    required this.descripcion,
    required this.informacionEncontrada,
    required this.datosRecuperados,
    required this.detalleNovedad,
  });

  String descripcion;
  bool informacionEncontrada;
  List<DatosRecuperado> datosRecuperados;
  String detalleNovedad;

  factory RespuestaRecurso.fromJson(Map<String, dynamic> json) =>
      RespuestaRecurso(
        descripcion: json["Descripcion"],
        informacionEncontrada: json["informacionEncontrada"],
        datosRecuperados: List<DatosRecuperado>.from(
            json["datosRecuperados"].map((x) => DatosRecuperado.fromJson(x))),
        detalleNovedad: json["detalleNovedad"],
      );

  Map<String, dynamic> toJson() => {
        "Descripcion": descripcion,
        "informacionEncontrada": informacionEncontrada,
        "datosRecuperados":
            List<dynamic>.from(datosRecuperados.map((x) => x.toJson())),
        "detalleNovedad": detalleNovedad,
      };
}

class DatosRecuperado {
  DatosRecuperado({
    required this.id,
    required this.link,
    required this.imagen,
  });

  String id;
  String link;
  String imagen;

  factory DatosRecuperado.fromJson(Map<String, dynamic> json) =>
      DatosRecuperado(
        id: json["id"],
        link: json["link"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "imagen": imagen,
      };
}
