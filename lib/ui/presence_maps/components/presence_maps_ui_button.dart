import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class PresenceMapButton extends StatefulWidget {
  const PresenceMapButton({super.key});

  @override
  PresenceMapButtonState createState() => PresenceMapButtonState();
}

class PresenceMapButtonState extends State<PresenceMapButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  bool _isCheckIn = false;
  bool _isButtonHeld = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    controller.addListener(() {
      setState(() {
        // The state that has changed here is the animation object’s value.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isButtonHeld =
              true; // Set _isButtonHeld to true when button is held down
        });
        controller.forward().then((value) {
          controller.reverse();
          if (controller.value == 1.0) {
            setState(() {
              _isCheckIn = !_isCheckIn;
            });
          }
        });
      },
      onTapUp: (_) {
        setState(() {
          _isButtonHeld =
              false; // Set _isButtonHeld to false when button is released
        });
        if (controller.status == AnimationStatus.forward) {
          controller.reverse();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AvatarGlow(
            glowColor: Theme.of(context).primaryColor,
            endRadius: 90.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor,
                    blurRadius: 40.0,
                    offset: const Offset(0, 12),
                    spreadRadius: -5.0,
                  ),
                ],
                gradient: !_isCheckIn
                    ? const LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.greenAccent,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : const LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.redAccent,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.height * 0.18,
            child: CircularProgressIndicator(
              value: controller.value,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Column(
            children: [
              Icon(
                _isButtonHeld
                    ? Icons.touch_app_outlined
                    : !_isCheckIn
                        ? Icons.fingerprint_outlined
                        : Icons.fingerprint_sharp,
                size: MediaQuery.of(context).size.height * 0.08,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                _isButtonHeld
                    ? 'Tahan'
                    : !_isCheckIn
                        ? 'Check In'
                        : 'Check Out',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
