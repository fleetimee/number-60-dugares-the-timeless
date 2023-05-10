import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PresenceMapBackgroundMap extends StatelessWidget {
  const PresenceMapBackgroundMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(-6.4503364, 107.0048695),
              zoom: 13,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
        ),
        // Make floating container for detail
      ],
    );
  }
}
