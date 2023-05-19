import 'package:auto_size_text/auto_size_text.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_timer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'presence_maps_ui_checkin_content.dart';
import 'presence_maps_ui_checkout_content.dart';

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
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: PresenceMapTimer(),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Container(
              height: MediaQuery.of(context).size.height * 0.285,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        showDragHandle: true,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return const PresenceMapCheckinContent();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      surfaceTintColor: Colors.white,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Text(
                      'Check In',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        showDragHandle: true,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return const PresenceMapCheckOutContent();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Text(
                      'Check Out',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
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
                color: Colors.black54,
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
                color: Colors.black45,
              ),
              maxLines: 2,
            ),
          ),
        ),
        ListTile(
          horizontalTitleGap: 10,
          leading: Icon(
            FluentIcons.panel_right_contract_20_regular,
            color: Theme.of(context).primaryColor,
            size: 35.0,
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
              const SizedBox(
                child: Text(
                  ' | ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  // horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
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
            child: const AutoSizeText(
              'Jam Check In',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
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
          horizontalTitleGap: 10,
          leading: Icon(
            FluentIcons.panel_right_expand_20_regular,
            color: Theme.of(context).primaryColor,
            size: 35.0,
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
              const SizedBox(
                child: Text(
                  ' | ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1.5,
                  ),
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
