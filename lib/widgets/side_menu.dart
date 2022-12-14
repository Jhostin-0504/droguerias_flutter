import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:maps_app/helpers/dialog_confirm.dart';
import 'package:maps_app/pages/login_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.padding_outlined),
            title: const Text('Inicio'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Asocoldro lo escucha'),
            onTap: () {
              //Navigator.pushNamed(context, HomePage.roteName)
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Eventos y capacitaciones'),
            onTap: () {
              //Navigator.pushNamed(context, HomePage.roteName)
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Iniciar Sesión'),
            onTap: () {
              dialogConfirmacion(
                  context, "CERRAR SESIÓN", "Confirma el cierre se sesión?");
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Cerrar Sesión'),
            onTap: () {
              dialogConfirmacion(
                  context, "CERRAR SESIÓN", "Confirma el cierre se sesión?");
            },
          )
        ],
      ),
    );
  }

  DrawerHeader _DrawerHeader() {
    return DrawerHeader(
      child: Container(),
      margin: EdgeInsets.only(top: 0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpeg'), fit: BoxFit.cover)),
    );
  }
}
