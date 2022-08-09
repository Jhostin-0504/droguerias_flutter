import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    required this.success,
  });

  Success success;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        success: Success.fromJson(json["success"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success.toJson(),
      };
}

class Success {
  Success({
    required this.code,
    required this.token,
    required this.entity,
    required this.message,
  });

  int code;
  String token;
  dynamic entity;
  String message;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        code: json["code"],
        token: json["token"],
        entity: json["entity"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "token": token,
        "entity": entity,
        "message": message,
      };
}
