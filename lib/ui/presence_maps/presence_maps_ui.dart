import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_background_map.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_container.dart';
import 'package:flutter/material.dart';

class PresenceMapPage extends StatefulWidget {
  const PresenceMapPage({super.key});

  @override
  State<PresenceMapPage> createState() => _PresenceMapPageState();
}

class _PresenceMapPageState extends State<PresenceMapPage> {
  final bool _inPresence = false;
  final bool _outPresence = false;

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
                onPressed: () {},
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
                  onPressed: () {},
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
          const PresenceMapBackgroundMap(),
          PresenceMapFloatingContainer(
            inPresence: _inPresence,
            outPresence: _outPresence,
          ),
        ],
      ),
    );
  }
}
