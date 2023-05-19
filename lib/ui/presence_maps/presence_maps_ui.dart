import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_background_map.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class PresenceMapPage extends StatefulWidget {
  const PresenceMapPage({super.key});

  @override
  State<PresenceMapPage> createState() => _PresenceMapPageState();
}

class _PresenceMapPageState extends State<PresenceMapPage>
    with TickerProviderStateMixin {
  // final MapController mapController = MapController();

  late final mapController = AnimatedMapController(
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).padding.left + 12),
          child: Material(
            elevation: 4, // set the elevation to create a shadow effect
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            child: CircleAvatar(
              minRadius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).padding.right + 16),
            child: Material(
              elevation: 4, // set the elevation to create a shadow effect
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              child: CircleAvatar(
                minRadius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    // center the map to the current location from geolocator
                    mapController.animateTo(
                      dest: LatLng(
                        -7.797068,
                        110.370529,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.location_searching_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PresenceMapBackgroundMap(
            mapController: mapController,
          ),
          const PresenceMapFloatingContainer(),
        ],
      ),
    );
  }
}
