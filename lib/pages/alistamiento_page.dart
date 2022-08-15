import 'package:flutter/material.dart';
import 'package:maps_app/helpers/alert.dart';
import 'package:maps_app/models/perguntas.dart';
import 'package:maps_app/models/solicitud.dart';
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
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: <Widget>[
                Image(image: AssetImage('assets/cargando.gif')),
                const SizedBox(
                  height: 10,
                ),
                Text('Construyendo...'),
              ],
            ),
          );
        },
      ),
    );
    /*return Scaffold(
      
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        
        child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_Form(), _Labels()],
          ),
        ),
      )),
    );*/
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

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final usuarioCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.person,
            placeholder: "Usuario",
            textController: usuarioCtrl,
            keyBoardType: TextInputType.number,
            isPassword: false,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: "Password",
            textController: passwordCtrl,
            keyBoardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 206, 30, 29), // background
                onPrimary: Colors.white, // foreground
                shape: StadiumBorder()),
            onPressed: authService.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.login(
                        usuarioCtrl.text.trim(), passwordCtrl.text.trim());
                    if (loginOk) {
                      //TODO: navegar
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => AlistamientoPage(),
                              transitionDuration: Duration(milliseconds: 0)));
                    } else {
                      //mostrar modal
                      mostrarAlerta(context, "Login incorercto",
                          "Revise sus credenciales");
                    }
                  },
            child: Container(
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Autenticar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const <Widget>[
          Text(
            'Drogas Calidad @ 2022',
            style: TextStyle(fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}

class SolicitudesDataSource {
  SolicitudesDataSource({required String solicitudes}) {
    /* _solicitudes = solicitudes
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'ref', value: e.ref),
              DataGridCell<DateTime>(
                  columnName: 'fecha', value: e.dateCreation),
              DataGridCell<String>(
                  columnName: 'razonSocial', value: e.razonSocial),
              DataGridCell<String>(columnName: 'asunto', value: e.asunto),
              DataGridCell<String>(columnName: 'detalle', value: e.detalle),
            ]))
        .toList();*/
  }

  /* List<DataGridRow> _solicitudes = [];

  @override
  List<DataGridRow> get rows => _solicitudes;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        /*alignment: (dataGridCell.columnName == 'ref' ||
                dataGridCell.columnName == 'salary')
            ? Alignment.centerRight
            : Alignment.centerLeft,*/
        padding: EdgeInsets.all(1.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }*/
}
