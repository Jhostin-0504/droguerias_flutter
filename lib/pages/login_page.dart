import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:maps_app/helpers/alert.dart';
import 'package:maps_app/pages/home.dart';
import 'package:maps_app/services/auth_services.dart';
import 'package:maps_app/widgets/logo.dart';
import '../widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Logo(
                label: 'Lo hacemos posible',
                pathImage: 'assets/importsoluciones-logo.png',
                ancho: 300,
              ),
              _Form(),
              _Labels()
            ],
          ),
        ),
      )),
    );
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
                primary: Colors.orange, // background
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
                              pageBuilder: (_, __, ___) => HomePage(),
                              transitionDuration: Duration(milliseconds: 0)));
                    } else {
                      //mostrar modal
                      mostrarAlerta(context, "Login incorercto",
                          "Revise sus credenciales");
                    }
                  },
            child: Container(
              width: double.infinity,
              child: Center(
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
        children: <Widget>[
          Text(
            'ImporSoluciones @ 2022',
            style: TextStyle(fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
