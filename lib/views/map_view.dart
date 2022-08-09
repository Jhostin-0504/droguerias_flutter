import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  const MapView({Key? key, required this.initialLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          //TODO markers
          //Polyline
          //TODO Cuando se mueve el mapa
        ));
  }
}
