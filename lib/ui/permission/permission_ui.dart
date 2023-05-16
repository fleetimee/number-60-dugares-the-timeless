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
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Theme.of(context).primaryColor,
                  child: const Center(
                    child: Text('Ijin'),
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
