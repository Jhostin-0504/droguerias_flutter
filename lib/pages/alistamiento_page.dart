import 'package:flutter/material.dart';
import 'package:maps_app/helpers/alert.dart';
import 'package:maps_app/services/auth_services.dart';
import 'package:maps_app/widgets/logo.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_input.dart';

class AlistamientoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPreguntasAlistamiento(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Cargando...'),
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
    final dataService = Provider.of<AuthService>(context);
    String fotoUsuario = await dataService.getAlistamientoForm();
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
