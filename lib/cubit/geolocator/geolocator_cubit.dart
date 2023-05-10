import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocator_state.dart';
part 'geolocator_cubit.freezed.dart';

class GeolocatorCubit extends Cubit<GeolocatorState> {
  GeolocatorCubit() : super(const GeolocatorState.initial());

  // Request permission location
  Future<void> requestPermission() async {
    emit(const GeolocatorState.loading());
    try {
      final LocationPermission permission =
          await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        emit(const GeolocatorState.error(
            message: 'Location permissions are denied'));
      } else {
        emit(const GeolocatorState.initial());
      }
    } catch (e) {
      emit(GeolocatorState.error(message: e.toString()));
    }
  }

  // Stream to listen to the position stream
  Stream<Position> get positionStream => Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

  // Method to get the current position
  Future<void> getCurrentPosition() async {
    emit(const GeolocatorState.loading());
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      emit(GeolocatorState.loaded(position: position));
    } catch (e) {
      emit(GeolocatorState.error(message: e.toString()));
    }
  }

  // Method to get the last known position
  Future<void> getLastKnownPosition() async {
    emit(const GeolocatorState.loading());
    try {
      final Position? position = await Geolocator.getLastKnownPosition();
      emit(GeolocatorState.loaded(position: position!));
    } catch (e) {
      emit(GeolocatorState.error(message: e.toString()));
    }
  }
}
