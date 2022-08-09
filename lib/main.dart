import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/screen/screens.dart';
import 'package:maps_app/blocs/blocs.dart';

void main() {
  //runApp(const MapsApp());
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => LocationBloc()),
      BlocProvider(create: (context) => MapBloc()),
    ],
    child: MapsApp(),
  ));
}

class MapsApp extends StatelessWidget {
  const MapsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoadingScreen(),
    );
  }
}
