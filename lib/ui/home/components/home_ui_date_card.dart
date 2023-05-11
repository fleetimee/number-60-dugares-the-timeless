import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeDateCard extends StatelessWidget {
  const HomeDateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${DateFormat('EEEE', 'id').format(DateTime.now())}, ${DateFormat('dd MMMM yyyy', 'id').format(DateTime.now())}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _HomeCardChip(
                'Presensi Masuk',
                Theme.of(context).primaryColor,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          _HomeCardListTile(
            Icons.login_rounded,
            'Check In',
            '08:00',
            Theme.of(context).primaryColor,
          ),
          const _HomeCardListTile(
            Icons.logout_rounded,
            'Check Out',
            '17:00',
            Colors.grey,
          ),
        ],
      ),
    );
  }
}

class _HomeCardChip extends StatelessWidget {
  const _HomeCardChip(
    this.text,
    this.backgroundColor,
  );

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _HomeCardListTile extends StatelessWidget {
  const _HomeCardListTile(
    this.icon,
    this.title,
    this.subtitle,
    this.iconColor,
  );

  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      minLeadingWidth: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Icon(
        Icons.check_circle_rounded,
        color: iconColor,
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }
}
