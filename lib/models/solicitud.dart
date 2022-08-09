import 'dart:convert';

Map<String, Solicitud> solicitudFromJson(String str) =>
    Map.from(json.decode(str))
        .map((k, v) => MapEntry<String, Solicitud>(k, Solicitud.fromJson(v)));
String solicitudToJson(Map<String, Solicitud> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Solicitud {
  Solicitud({
    required this.rowid,
    required this.ref,
    required this.dateCreation,
    required this.razonSocial,
    required this.asunto,
    required this.detalle,
    required this.idUsuario,
  });
  String rowid;
  String ref;
  DateTime dateCreation;
  String razonSocial;
  String asunto;
  String detalle;
  String idUsuario;
  factory Solicitud.fromJson(Map<String, dynamic> json) => Solicitud(
        rowid: json["rowid"],
        ref: json["ref"],
        dateCreation: DateTime.parse(json["date_creation"]),
        razonSocial: json["razon_social"],
        asunto: json["asunto"],
        detalle: json["detalle"],
        idUsuario: json["idUsuario"],
      );
  Map<String, dynamic> toJson() => {
        "rowid": rowid,
        "ref": ref,
        "date_creation": dateCreation.toIso8601String(),
        "razon_social": razonSocial,
        "asunto": asunto,
        "detalle": detalle,
        "idUsuario": idUsuario,
      };
}
