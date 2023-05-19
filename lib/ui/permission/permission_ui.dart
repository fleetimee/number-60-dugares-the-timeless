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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AvatarGlow(
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
                          const Text(
                            'Cepat Pulang',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0XFF0097F2),
                        Color(0XFF0099F6),
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AvatarGlow(
                          endRadius: 80,
                          showTwoGlows: false,
                          child: IconButton(
                            icon: CircleAvatar(
                              backgroundColor: Colors.blue.shade600,
                              radius: 50,
                              child: const Icon(
                                size: 80,
                                Icons.mark_as_unread_outlined,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const Text(
                          'Tidak Masuk Kerja',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
