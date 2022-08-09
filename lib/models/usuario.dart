import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.rowid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.photo,
  });

  String rowid;
  String firstname;
  String lastname;
  String email;
  String photo;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        rowid: json["rowid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "rowid": rowid,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "photo": photo,
      };
}
