import 'package:flutter/material.dart';
import 'package:maps_app/helpers/alert.dart';
import 'package:maps_app/models/perguntas.dart';
import 'package:maps_app/models/solicitud.dart';
import 'package:maps_app/models/usuario.dart';
import 'package:maps_app/services/auth_services.dart';
import 'package:maps_app/widgets/logo.dart';
import 'package:provider/provider.dart';

import '../services/alistamiento_services.dart';
import '../widgets/custom_input.dart';

class AlistamientoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPreguntasAlistamiento(context),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _ListaPreguntas(snapshot.data);
            }
          }),
    );
  }

  Future getPreguntasAlistamiento(BuildContext context) async {
    final dataService = Provider.of<AlistamientoServices>(context);
    List<Preguntas> data = await dataService.loadAlistamiento();

    /*var DataSource =
        SolicitudesDataSource(solicitudes: dataService.loadAlistamiento);*/

    //List<Solicitud> preguntasAlistamiento = await dataService.getAlistamientoForm();
    //final preguntas = solicitudFromJson(response.body);
  }
}

class _ListaPreguntas extends StatelessWidget {
  final List<Preguntas> usuarios;
  _ListaPreguntas(this.usuarios);

  @override
  _ListaPreguntas createState() => _ListaPreguntas(usuarios);
  Widget build(BuildContext context) {
    double _sliderValue = 100;
    bool _sliderEnable = true;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Preguntas Alistamiento"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Preguntas",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "respuesta",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    CheckboxListTile(
                        activeColor: Colors.tealAccent,
                        title: const Text(
                          "Habilitar Slider",
                        ),
                        value: _sliderEnable,
                        onChanged: (value) => setState(() {
                              _sliderEnable = value ?? true;
                            })),
                  ],
                ),
              ),
            );
          },
          itemCount: usuarios.length,
        ));
  }
  /* Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, i) {
        final Usuario = usuarios[i];
        return ListTile();
      },
    );
  }*/
}
