import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_button.dart';
import 'package:bpd_hris/ui/presence_maps/components/presence_maps_ui_timer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PresenceMapCheckOutContent extends StatelessWidget {
  const PresenceMapCheckOutContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background.jpg',
          ),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          // colorFilter: ColorFilter.mode(
          //   Colors.white70,
          //   BlendMode.lighten,
          // ),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PresenceMapTimer(),
          const SizedBox(
            height: 120,
          ),
          PresenceMapButton(
            text: 'Check Out',
            gradientColors: [
              Colors.red.shade800,
              Colors.red.shade400,
            ],
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FluentIcons.location_48_filled,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Kantor Pusat Bank BPD DIY',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
