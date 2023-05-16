import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_button.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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
      bottom: MediaQuery.of(context).size.height * 0.06,
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
                      child: const Center(
                        child: PresenceMapTimer(),
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
            Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.grey.shade200,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          Text(
                            'Dalam Area Presensi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                              fontSize: 16.0,
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
                      subtitle: const Text(
                        'Jln. Letnan Jenderal S. Parman No. 28, Kota Semarang (Kantor Pusat)',
                      ),
                    ),
                    ListTile(
                      // horizontalTitleGap: 0.0,
                      leading: Icon(
                        Icons.login,
                        color: Theme.of(context).primaryColor,
                      ),
                      dense: true,
                      title: Row(
                        children: [
                          const Text(
                            '07.30',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
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
                      subtitle: const Text(
                        'Berhasil presensi pukul 07.30.29',
                      ),
                      trailing: Icon(
                        Icons.check_circle,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    ListTile(
                      // horizontalTitleGap: 0.0,
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.grey,
                      ),
                      dense: true,
                      title: Row(
                        children: [
                          const Text(
                            '07.30',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
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
                      subtitle: const Text(
                        'Belum melakukan presensi',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.hourglass_bottom,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
