part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool IsMapInitialized;
  final bool followUser;

  const MapState({this.IsMapInitialized = false, this.followUser = false});

  MapState copyWith({
    bool? IsMapInitialized,
    bool? followUser,
  }) =>
      MapState(
        IsMapInitialized: IsMapInitialized ?? this.IsMapInitialized,
        followUser: followUser ?? this.followUser,
      );

  @override
  List<Object> get props => [IsMapInitialized, followUser];
}
