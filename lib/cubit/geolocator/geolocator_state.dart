part of 'geolocator_cubit.dart';

@freezed
class GeolocatorState with _$GeolocatorState {
  const factory GeolocatorState.initial() = _Initial;
  const factory GeolocatorState.loading() = _Loading;
  const factory GeolocatorState.loaded({
    required Position position,
  }) = _Loaded;
  const factory GeolocatorState.error({
    required String message,
  }) = _Error;
}
