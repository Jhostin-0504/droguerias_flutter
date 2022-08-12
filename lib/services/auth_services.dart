import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:convert';
import 'package:maps_app/global/environment.dart';
import 'package:maps_app/models/solicitud.dart';
import 'package:maps_app/models/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maps_app/models/usuario.dart';

class AuthService with ChangeNotifier {
  final _storage = new FlutterSecureStorage();
  String photoUser = '';
  bool _autenticando = false;
  bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }
  //final token

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<String?> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String login, String password) async {
    final data = {
      'username': login,
      'password': password,
    };
    String url = '${Environment.apiUrl}/login_check';
    /*final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http2 = new IOClient(ioc);
    http.Response response = await http2.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    this.autenticando = false;
    if (response.statusCode == 200) {
      final tokenResponse = tokenFromJson(response.body);
      await this._guardarToken(tokenResponse.token);
      final tokenToJsonResp = tokenToJson(tokenResponse);
      //print(tokenResponse.success.token);

      return true;
    } else {
      return false;
    }*/
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    this.autenticando = false;
    if (response.statusCode == 200) {
      final tokenResponse = tokenFromJson(response.body);
      await this._guardarToken(tokenResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLoginIn() async {
    return false; /*
    final token = await _storage.read(key: 'token');
    String url = '${Environment.apiUrl}solubitacoraapi/usser?token=${token}';
    Map<String, String> headers = new HashMap();
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('DOLAPIKEY', () => '${token}');
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final usuarioResponse = usuarioFromJson(response.body);
      await this._guardarUserId(usuarioResponse.rowid);
      await this._guardarUserPhoto(usuarioResponse.photo);
      this.photoUser = usuarioResponse.photo.toString().substring(22);
      notifyListeners();
      return true;
    } else {
      this.logout();
      return false;
    }*/
  }

  /*
  Future<bool> isLoginIn() async {
    final token = await _storage.read(key: 'token');
    String url = '${Environment.apiUrl}status';
    Map<String, String> headers = new HashMap();
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('DOLAPIKEY', () => '${token}');
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      this.logout();
      return false;
    }
  }
  */
  Future _guardarTokenAuth(String data) async {
    return await _storage.write(key: 'dataAuth', value: data);
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future _guardarUserId(String userId) async {
    return await _storage.write(key: 'userId', value: userId);
  }

  static Future<String?> getUserId() async {
    final _storage = new FlutterSecureStorage();
    final userId = await _storage.read(key: 'userId');
    return userId;
  }

  Future _guardarUserPhoto(String userPhoto) async {
    return await _storage.write(key: 'userPhoto', value: userPhoto);
  }

  Future<String?> getPhoto() async {
    final _storage = new FlutterSecureStorage();
    final userPhoto = await _storage.read(key: 'userPhoto');
    return userPhoto;
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

  Future<String> getAlistamientoForm() async {
    final token = await _storage.read(key: 'token');
    String url = '${Environment.apiUrl}/alistamiento_diario/preguntas';
    Map<String, String> headers = new HashMap();
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Authorization', () => 'Bearer ${token}');
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      //final solicitud = solicitudFromJson(response.body);
      return response.body;
    } else {
      return "";
    }
  }
}
