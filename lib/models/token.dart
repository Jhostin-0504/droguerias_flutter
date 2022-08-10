import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));
String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    required this.currentUser,
    required this.csrfToken,
    required this.logoutToken,
  });
  CurrentUser currentUser;
  String csrfToken;
  String logoutToken;
  factory Token.fromJson(Map<String, dynamic> json) => Token(
        currentUser: CurrentUser.fromJson(json["current_user"]),
        csrfToken: json["csrf_token"],
        logoutToken: json["logout_token"],
      );
  Map<String, dynamic> toJson() => {
        "current_user": currentUser.toJson(),
        "csrf_token": csrfToken,
        "logout_token": logoutToken,
      };
}

class CurrentUser {
  CurrentUser({
    required this.uid,
    required this.name,
  });
  String uid;
  String name;
  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        uid: json["uid"],
        name: json["name"],
      );
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
      };
}
