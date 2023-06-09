import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PresenceMapTimer extends StatefulWidget {
  const PresenceMapTimer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PresenceMapTimerState createState() => _PresenceMapTimerState();
}

class _PresenceMapTimerState extends State<PresenceMapTimer> {
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    // Get the current time when the widget is created
    _getCurrentTime();
    // Start the timer to update the time every second
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    super.dispose();
    // stop listening to the timer when the widget is disposed
  }

  void _getCurrentTime() {
    if (mounted) {
      setState(() {
        // Update the state only if the widget is still in the tree
        DateTime now = DateTime.now();
        String hours = _twoDigits(now.hour);
        String minutes = _twoDigits(now.minute);
        String seconds = _twoDigits(now.second);
        currentTime = '$hours:$minutes:$seconds';
      });
    }
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentTime,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            // shadows: [
            //   Shadow(
            //     color: Colors.black87,
            //     offset: Offset(5, 1),
            //     blurRadius: 15,
            //   )
            // ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          DateFormat('EEEE, d MMMM yyyy', 'id').format(DateTime.now()),
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            // shadows: [
            //   Shadow(
            //     color: Colors.black54,
            //     offset: Offset(5, 1),
            //     blurRadius: 15,
            //   )
            // ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
