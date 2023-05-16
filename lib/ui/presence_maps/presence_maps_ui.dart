import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_background_map.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_container.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:go_router/go_router.dart';

class PresenceMapPage extends StatefulWidget {
  const PresenceMapPage({super.key});

  @override
  State<PresenceMapPage> createState() => _PresenceMapPageState();
}

class _PresenceMapPageState extends State<PresenceMapPage> {
  bool _isMapVisible = true;

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
                    setState(() {
                      _isMapVisible = !_isMapVisible;
                    });

                    if (!_isMapVisible) {
                      CherryToast.success(
                        title: const Text('Menampilkan Peta'),
                        toastPosition: Position.top,
                        animationType: AnimationType.fromLeft,
                        animationDuration: const Duration(milliseconds: 100),
                        toastDuration: const Duration(seconds: 1),
                      ).show(context);
                    } else {
                      CherryToast.success(
                        title: const Text('Menyembunyikan Peta'),
                        toastPosition: Position.top,
                        animationType: AnimationType.fromLeft,
                        animationDuration: const Duration(milliseconds: 100),
                        toastDuration: const Duration(seconds: 1),
                      ).show(context);
                    }
                  },
                  icon: Icon(
                    !_isMapVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _isMapVisible
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.8),
                    // Make custom shape for background
                  )
                : null,
          ),
          Column(
            children: [
              ClipPath(
                clipper: WaveClipperOne(reverse: false),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Theme.of(context).primaryColor.withOpacity(1),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
              ),
              ClipPath(
                clipper: WaveClipperTwo(
                  reverse: true,
                  flip: true,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Theme.of(context).primaryColor.withOpacity(1),
                ),
              ),
            ],
          ),
          PresenceMapFloatingContainer(
            isMapVisible: _isMapVisible,
          )
        ],
      ),
    );
  }
}
