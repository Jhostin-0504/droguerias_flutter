import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BotonAccion extends StatelessWidget {
  final Color colorPrimario;
  final Color colorSecundario;
  final Color colorFuente;

  const BotonAccion(
      {super.key,
      required this.colorPrimario,
      required this.colorSecundario,
      required this.colorFuente});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: this.colorPrimario, // background
          onPrimary: this.colorSecundario, // foreground
          shape: StadiumBorder()),
      onPressed: () {
        //print(usuarioCtrl.text);
        //print(passwordCtrl.text);
      },
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(
            "Autenticar",
            style: TextStyle(
              color: this.colorFuente,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
