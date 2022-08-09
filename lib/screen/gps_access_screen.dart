import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          print('state: $state');
          return !state.isGpsEnabled ? _EnabledGpsMasage() : _AccessButton();
        },
      )
          // _AccessButton(),
          ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Es necesario el acceso a GPS"),
        MaterialButton(
            child: Text(
              "Solicitar Acceso",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black87,
            shape: StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            onPressed: () {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              //final gpsBloc = context.read<GpsBloc>();
              gpsBloc.askGpsAccess();
            })
      ],
    );
  }
}

class _EnabledGpsMasage extends StatelessWidget {
  const _EnabledGpsMasage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Debe habilitar el acceso a GPS",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
