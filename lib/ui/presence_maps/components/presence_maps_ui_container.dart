import 'package:auto_size_text/auto_size_text.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_timer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PresenceMapFloatingContainer extends StatefulWidget {
  const PresenceMapFloatingContainer({
    super.key,
  });

  @override
  State<PresenceMapFloatingContainer> createState() =>
      _PresenceMapFloatingContainerState();
}

class _PresenceMapFloatingContainerState
    extends State<PresenceMapFloatingContainer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.04,
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
              child: Container(
                key: const ValueKey<bool>(false),
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
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
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            // AnimatedSwitcher(
            //   duration: const Duration(milliseconds: 500),
            //   transitionBuilder: (Widget child, Animation<double> animation) {
            //     return ScaleTransition(
            //       scale: animation,
            //       child: child,
            //     );
            //   },
            //   child: !widget.isMapVisible
            //       ? SizedBox(
            //           key: const ValueKey<bool>(false),
            //           height: MediaQuery.of(context).size.height * 0.22,
            //         )
            //       : const PresenceMapButton(),
            // ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.06),

            Container(
              key: const ValueKey<bool>(false),
              height: MediaQuery.of(context).size.height * 0.285,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PresenceMapDetailContainer(),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(-20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.blue.shade900,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        disabledForegroundColor:
                            Colors.transparent.withOpacity(0.38),
                        disabledBackgroundColor:
                            Colors.transparent.withOpacity(0.12),
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(-20),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Check In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(-20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red.shade700,
                          Colors.red.shade500,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        disabledForegroundColor:
                            Colors.transparent.withOpacity(0.38),
                        disabledBackgroundColor:
                            Colors.transparent.withOpacity(0.12),
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(-20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Check Out',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
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
          title: SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: const AutoSizeText(
              'Dalam Area Presensi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 18,
              ),
              maxLines: 2,
            ),
          ),
          subtitle: const SizedBox(
            child: AutoSizeText(
              'Jln. Letnan Jenderal S. Parman No. 28, Kota Semarang (Kantor Pusat)',
              style: TextStyle(
                fontSize: 14,
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
              const SizedBox(
                child: AutoSizeText(
                  '07.30',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16,
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
              'Jam Check In',
              style: TextStyle(
                fontSize: 14,
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
                    fontSize: 16,
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
          subtitle: const SizedBox(
            child: Text(
              'Jam Check Out',
              style: TextStyle(
                fontSize: 14,
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
