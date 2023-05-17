import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ijin'),
      ),
      body: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0XFF5B2849),
                          Color(0XFF663956),
                        ],
                      ),
                    ),
                    child: Center(
                      child: AvatarGlow(
                        endRadius: 80,
                        showTwoGlows: false,
                        child: IconButton(
                          icon: const CircleAvatar(
                            backgroundColor: Color(0XFF663956),
                            radius: 50,
                            child: Icon(
                              size: 80,
                              Icons.schedule,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.white,
                  child: const Center(
                    child: Text('Ijin'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
