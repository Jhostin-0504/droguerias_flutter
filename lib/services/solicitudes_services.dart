import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'package:maps_app/global/environment.dart';
import 'package:maps_app/models/solicitud.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SolicitudesServices extends ChangeNotifier {
  final String _baseURL = '${Environment.apiUrl}';
  final List<Solicitud> solicitudes = [];
  bool isLoading = true;
  SolicitudesServices() {
    this.loadSolicitudes();
    print(solicitudes);
  }
  Future<List<Solicitud>> loadSolicitudes() async {
    this.isLoading = true;
    notifyListeners();
    //int userId = 262;
    final token = await getToken();
    final userId = await getUserId();
    String url = '${Environment.apiUrl}solubitacoraapi/solicitudes/${userId}';
    print(url);
    Map<String, String> headers = new HashMap();
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('DOLAPIKEY', () => '${token}');
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final solicitudesMap = solicitudFromJson(response.body);
      solicitudesMap.forEach((key, value) {
        this.solicitudes.add(value);
      });
      this.isLoading = false;
      notifyListeners();
      return this.solicitudes;
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
