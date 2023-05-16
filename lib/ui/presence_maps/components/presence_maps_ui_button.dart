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
      onTapDown: (_) => controller.forward().then(
            (value) => {
              controller.reverse(),
              if (controller.value == 1.0)
                {
                  setState(() {
                    _isCheckIn = !_isCheckIn;
                  }),
                  print(_isCheckIn)
                }
            },
          ),
      onTapUp: (_) {
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
              // child: const CircularProgressIndicator(
              //   value: 1.0,
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              // ),
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
                !_isCheckIn ? Icons.fingerprint_outlined : Icons.fingerprint,
                size: 58.0,
                color: Colors.white,
              ),
              const SizedBox(height: 8.0),
              Text(
                !_isCheckIn ? 'Check In' : 'Check Out',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
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
