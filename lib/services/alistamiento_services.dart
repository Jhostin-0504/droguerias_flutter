import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maps_app/global/environment.dart';
import 'package:maps_app/models/perguntas.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AlistamientoServices extends ChangeNotifier {
  final String _baseURL = '${Environment.apiUrl}';
  final List<Preguntas> alistamiento = [];
  bool isLoading = true;
  AlistamientoServices() {
    this.loadAlistamiento();
    print(alistamiento);
  }
  Future<List<Preguntas>> loadAlistamiento() async {
    this.isLoading = true;
    notifyListeners();
    final token = await getToken();
    String url = '${Environment.apiUrl}/alistamiento_diario/preguntas';
    Map<String, String> headers = new HashMap();
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Authorization', () => 'Bearer ${token}');
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final preguntasMap = json.decode(response.body);
      preguntasMap.forEach((key, value) {
        this.alistamiento.add(value);
        print(key);
      });
      this.isLoading = false;
      notifyListeners();
      //return this.alistamiento;
      return preguntasMap;
    } else {
      this.isLoading = false;
      notifyListeners();
      return [];
    }
  }

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<String?> getUserId() async {
    final _storage = new FlutterSecureStorage();
    final userId = await _storage.read(key: 'userId');
    return userId;
  }
}
