import 'package:auto_size_text/auto_size_text.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_button.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_timer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PresenceMapFloatingContainer extends StatefulWidget {
  const PresenceMapFloatingContainer({
    super.key,
    required this.isMapVisible,
  });

  final bool isMapVisible;

  @override
  State<PresenceMapFloatingContainer> createState() =>
      _PresenceMapFloatingContainerState();
}

class _PresenceMapFloatingContainerState
    extends State<PresenceMapFloatingContainer> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  // ignore: unused_field
  final bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.15,
      left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: !widget.isMapVisible
                  ? Container(
                      key: const ValueKey<bool>(false),
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: PresenceMapTimer(),
                          ),
                        ],
                      ),
                    )
                  : const PresenceMapTimer(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: !widget.isMapVisible
                  ? SizedBox(
                      key: const ValueKey<bool>(false),
                      height: MediaQuery.of(context).size.height * 0.22,
                    )
                  : const PresenceMapButton(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: !widget.isMapVisible
                  ? Container(
                      key: const ValueKey<bool>(false),
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PresenceMapDetailContainer(),
                        ],
                      ),
                    )
                  : const PresenceMapDetailContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class PresenceMapDetailContainer extends StatelessWidget {
  const PresenceMapDetailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.5,
                child: const AutoSizeText(
                  'Dalam Area Presensi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 24,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Text(
                  'Pulang',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          subtitle: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: const AutoSizeText(
              'Jln. Letnan Jenderal S. Parman No. 28, Kota Semarang (Kantor Pusat)',
              style: TextStyle(
                fontSize: 30,
              ),
              maxLines: 2,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.login,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
          dense: true,
          title: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                child: const AutoSizeText(
                  '07.30',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Text(
                  '12 Januari 2023',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          subtitle: SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.5,
            child: const AutoSizeText(
              'Berhasil presensi pukul 07.30.29',
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 2,
            ),
          ),
          trailing: Icon(
            Icons.check_circle,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
        ),
        ListTile(
          // horizontalTitleGap: 0.0,
          leading: const Icon(
            Icons.logout,
            color: Colors.grey,
            size: 30.0,
          ),
          dense: true,
          title: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                child: const AutoSizeText(
                  '07.30',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Text(
                  '12 Januari 2023',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          subtitle: SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Text(
              'Belum melakukan presensi',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              maxLines: 2,
            ),
          ),
          trailing: const Icon(
            Icons.hourglass_bottom,
            color: Colors.grey,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
