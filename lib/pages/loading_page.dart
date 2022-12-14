// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:maps_app/pages/alistamiento_page.dart';
import 'package:provider/provider.dart';
import 'package:maps_app/pages/login_page.dart';
import 'package:maps_app/services/auth_services.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: <Widget>[
                Image(image: AssetImage('assets/cargando.gif')),
                const SizedBox(
                  height: 10,
                ),
                Text('Cargando...w'),
              ],
            ),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    bool? autenticado = null;
    autenticado = await authService.isLoginIn();
    if (autenticado) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => AlistamientoPage(),
              transitionDuration: Duration(milliseconds: 0)));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: 0)));
    }
  }
}
