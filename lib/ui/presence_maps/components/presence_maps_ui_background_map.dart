import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class PresenceMapBackgroundMap extends StatefulWidget {
  const PresenceMapBackgroundMap({
    super.key,
    required this.mapController,
  });

  final MapController mapController;

  @override
  State<PresenceMapBackgroundMap> createState() =>
      _PresenceMapBackgroundMapState();
}

class _PresenceMapBackgroundMapState extends State<PresenceMapBackgroundMap> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    widget.mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            mapController: widget.mapController,
            options: MapOptions(
              interactiveFlags:
                  InteractiveFlag.pinchZoom | InteractiveFlag.drag,
              center: LatLng(-7.7850082, 110.360223),
              zoom: 13.5,
              maxZoom: 18,
              minZoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                minZoom: 10,
                maxZoom: 18,

                // 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                // tileBuilder: darkModeTileBuilder,
                // backgroundColor: Colors.black54,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(-7.7850082, 110.360223),
                    width: 80,
                    height: 80,
                    builder: (context) {
                      // return radius like marker
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      );
                    },
                  ),
                  Marker(
                    point: LatLng(-7.7831862, 110.323559),
                    width: 80,
                    height: 80,
                    builder: (context) {
                      // return radius like marker
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      );
                    },
                  ),
                  Marker(
                    point: LatLng(-7.7825683, 110.3528775),
                    width: 80,
                    height: 80,
                    builder: (context) {
                      // return radius like marker
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      );
                    },
                  ),
                ],
              ),
              CurrentLocationLayer(), // <-- add layer here
            ],
          ),
        ),
        // Make floating container for detail
      ],
    );
  }
}
