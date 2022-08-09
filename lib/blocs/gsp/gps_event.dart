part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];

  get isGpsPermissionGranted => null;

  get isGpsEnabled => null;
}

class GpsAndPermissionEvent extends GpsEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;
  const GpsAndPermissionEvent(
      {required this.isGpsEnabled, required this.isGpsPermissionGranted});
}
