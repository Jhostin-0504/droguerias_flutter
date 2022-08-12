import 'package:flutter/material.dart';
import 'package:maps_app/pages/alistamiento_page.dart';
import 'package:maps_app/pages/login_page.dart';
import 'package:maps_app/pages/loading_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'loading': (_) => LoadingPage(),
  'alistamiento': (_) => AlistamientoPage(),
};
