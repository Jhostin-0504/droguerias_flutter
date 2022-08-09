import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:maps_app/services/auth_services.dart';

dialogConfirmacion(BuildContext context, String titulo, String subtitulo) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(titulo),
              content: Text(subtitulo),
              actions: <Widget>[
                MaterialButton(
                    child: Text('Si'),
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => {
                          Navigator.pop(context),
                          AuthService.deleteToken(),
                          Navigator.pushReplacementNamed(context, 'login')
                        }),
                MaterialButton(
                    child: Text('No'),
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => Navigator.pop(context))
              ],
            ));
  } else {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          CupertinoDialogAction(
              child: Text("Si"),
              onPressed: () {
                Navigator.of(context).pop();
                AuthService.deleteToken();
                Navigator.pushReplacementNamed(context, 'login');
              }),
          CupertinoDialogAction(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}
