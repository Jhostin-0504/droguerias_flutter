import 'package:flutter/material.dart';

class LoadingScreenLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Solicitudes")),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.indigo,
          ),
        ));
  }
}
