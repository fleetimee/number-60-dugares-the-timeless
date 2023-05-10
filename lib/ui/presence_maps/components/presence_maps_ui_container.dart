import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:slide_action/slide_action.dart';

// ignore: must_be_immutable
class PresenceMapFloatingContainer extends StatefulWidget {
  const PresenceMapFloatingContainer({
    super.key,
    required bool inPresence,
    required bool outPresence,
  })  : _inPresence = inPresence,
        _outPresence = outPresence;

  final bool _inPresence;
  final bool _outPresence;

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

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: AnimatedTimeWidget(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        'Jln. Letnan Jenderal S. Parman No. 28, Kota Semarang',
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SlideAction(
                      trackBuilder: (context, state) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: state.isPerformingAction
                                ? const CupertinoActivityIndicator()
                                : GradientText(
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                    'Geser untuk Presensi',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                    colors: [
                                      Colors.blue.shade900,
                                      Colors.blue.shade500,
                                    ],
                                  ),
                          ),
                        );
                      },
                      thumbBuilder: (context, state) {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            // Show loading indicator if async operation is being performed
                            child: state.isPerformingAction
                                ? const CupertinoActivityIndicator(
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.fingerprint,
                                    color: Colors.white,
                                  ),
                          ),
                        );
                      },
                      action: () async {
                        // Async operation
                        await Future.delayed(
                          const Duration(seconds: 2),
                          () => debugPrint("Hello World"),
                        );
                      },
                    ),
                    const SizedBox(height: 12.0),
                    ListTile(
                      horizontalTitleGap: 0.0,
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
                              'Selasa, 12 Januari 2023',
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
                      horizontalTitleGap: 0.0,
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
                              'Selasa, 12 Januari 2023',
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
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.9,
                  40.0,
                ),
              ),
              icon: const Icon(
                Icons.history,
                color: Colors.white,
              ),
              label: const Text(
                'Riwayat Presensi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTimeWidget extends StatefulWidget {
  const AnimatedTimeWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTimeWidgetState createState() => _AnimatedTimeWidgetState();
}

class _AnimatedTimeWidgetState extends State<AnimatedTimeWidget> {
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is created
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  void _getCurrentTime() {
    setState(() {
      // Get the current time
      DateTime now = DateTime.now();
      String hours = _twoDigits(now.hour);
      String minutes = _twoDigits(now.minute);
      String seconds = _twoDigits(now.second);
      currentTime = '$hours : $minutes : $seconds';
    });
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentTime,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
