import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:maps_app/helpers/dialog_confirm.dart';
import 'package:maps_app/models/solicitud.dart';
import 'package:maps_app/screen/loading_screan_login.dart';
import 'package:maps_app/services/auth_services.dart';
import 'package:maps_app/services/solicitudes_services.dart';
import 'package:maps_app/widgets/side_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //FactCheckOutlined
    final authService = Provider.of<AuthService>(context);
    String fotoUsuario = authService.photoUser;
    Uint8List photoUser64str = base64.decode(fotoUsuario);
    final solicitudesService = Provider.of<SolicitudesServices>(context);
    if (solicitudesService.isLoading) return LoadingScreenLogin();

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          title: Text('Bitácota'),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Container(
                padding: EdgeInsets.all(1.0),
                child: CircleAvatar(
                  backgroundImage: MemoryImage(photoUser64str),
                  radius: 32.0,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("Texto"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
