import 'package:bpd_hris/common/const/string_constant.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HomeMenuGridEntities {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  HomeMenuGridEntities({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });
}

class HomeHelpListEntities {
  final String title;
  final String content;
  final String imagePath;
  final String status;
  final VoidCallback onTap;
  final String date;

  HomeHelpListEntities({
    required this.title,
    required this.content,
    required this.imagePath,
    required this.status,
    required this.onTap,
    required this.date,
  });
}

class HomeButtonEntities {
  final String title;
  final IconData icon;
  final String routeName;

  HomeButtonEntities(
      {required this.title, required this.icon, required this.routeName});
}

class HomeShortcutGridEntities {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  HomeShortcutGridEntities({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });
}

final List<HomeMenuGridEntities> homeMenuGridEntities = [
  HomeMenuGridEntities(
    title: StringConstant.emergency,
    imagePath: 'assets/images/home_menu_grid_emergency.png',
    onTap: () {},
  ),
  HomeMenuGridEntities(
    title: StringConstant.help,
    imagePath: 'assets/images/home_menu_grid_help.png',
    onTap: () {},
  ),
  HomeMenuGridEntities(
    title: StringConstant.news,
    imagePath: 'assets/images/home_menu_grid_news.png',
    onTap: () {},
  ),
  HomeMenuGridEntities(
    title: StringConstant.scanJss,
    imagePath: 'assets/images/home_menu_grid_scan_jss.png',
    onTap: () {},
  ),
  HomeMenuGridEntities(
    title: StringConstant.general,
    imagePath: 'assets/images/home_menu_grid_general.png',
    onTap: () {},
  ),
  HomeMenuGridEntities(
    title: StringConstant.dukcapil,
    imagePath: 'assets/images/home_menu_grid_dukcapil.png',
    onTap: () {},
  ),
  HomeMenuGridEntities(
    title: StringConstant.health,
    imagePath: 'assets/images/home_menu_grid_health.png',
    onTap: () {},
  ),
  HomeMenuGridEntities(
    title: StringConstant.other,
    imagePath: 'assets/images/home_menu_grid_other.png',
    onTap: () {},
  ),
];

final List<HomeHelpListEntities> homeHelpListEntities = [
  HomeHelpListEntities(
    title: 'Pelanggaran Reklame',
    content:
        'Reklame sebuah merk toko di Jalan Kaliurang, Sleman, Yogyakarta, diduga melanggar aturan. Reklame tersebut dipasang di atas trotoar dan menghalangi jalan pejalan kaki.',
    imagePath: 'assets/images/home_help_image1.jpg',
    onTap: () {},
    status: 'Lapor',
    date: '2 Mei 2023, 7.42',
  ),
  HomeHelpListEntities(
    title: 'Penerangan Jalan Umum',
    content:
        'Penerangan jalan umum (PJU) di Jalan Kaliurang, Sleman, Yogyakarta, tidak menyala. Hal ini membuat pengendara kesulitan melintas di malam hari.',
    imagePath: 'assets/images/home_help_image2.jpg',
    onTap: () {},
    status: 'Lapor',
    date: '5 Mei 2023, 7.42',
  ),
  HomeHelpListEntities(
    title: 'Pengaduan Jalan Rusak',
    content:
        'Jalan di Jalan Kaliurang, Sleman, Yogyakarta, rusak parah. Hal ini membuat pengendara kesulitan melintas di malam hari.',
    imagePath: 'assets/images/home_help_image3.jpg',
    onTap: () {},
    status: 'Dikerjakan',
    date: '7 Mei 2023, 7.42',
  ),
  HomeHelpListEntities(
    title: 'Pengaduan Jalan Rusak',
    content:
        'Jalan di Jalan Kaliurang, Sleman, Yogyakarta, rusak parah. Hal ini membuat pengendara kesulitan melintas di malam hari.',
    imagePath: 'assets/images/home_help_image4.jpg',
    onTap: () {},
    status: 'Selesai',
    date: '9 Mei 2023, 7.42',
  ),
  HomeHelpListEntities(
    title: 'Saluran Air Tersumbat',
    content:
        'Saluran air di Jalan Kaliurang, Sleman, Yogyakarta, tersumbat. Hal ini membuat pengendara kesulitan melintas di malam hari.',
    imagePath: 'assets/images/home_help_image5.jpg',
    onTap: () {},
    status: 'Selesai',
    date: '11 Mei 2023, 7.42',
  ),
  HomeHelpListEntities(
    title: 'Pengaduan Jalan Rusak',
    content:
        'Jalan di Jalan Kaliurang, Sleman, Yogyakarta, rusak parah. Hal ini membuat pengendara kesulitan melintas di malam hari.',
    imagePath: 'assets/images/home_help_image6.jpg',
    onTap: () {},
    status: 'Selesai',
    date: '13 Mei 2023, 7.42',
  ),
];

final List<HomeShortcutGridEntities> homeShortcutGridEntities = [
  HomeShortcutGridEntities(
    title: StringConstant.jobsList,
    imagePath: 'assets/images/home_shortcut_grid_jobs.png',
    onTap: () {},
  ),
  HomeShortcutGridEntities(
    title: StringConstant.learn,
    imagePath: 'assets/images/home_shortcut_grid_learn.png',
    onTap: () {},
  ),
  HomeShortcutGridEntities(
    title: StringConstant.clipping,
    imagePath: 'assets/images/home_shortcut_grid_clipping.png',
    onTap: () {},
  ),
  HomeShortcutGridEntities(
    title: StringConstant.cctv,
    imagePath: 'assets/images/home_shortcut_grid_cctv.png',
    onTap: () {},
  ),
];

final List<HomeButtonEntities> homeButtonEntitiesList = [
  HomeButtonEntities(
    title: 'Presensi',
    icon: FluentIcons.fingerprint_48_regular,
    routeName: '/presence',
  ),
  HomeButtonEntities(
    title: 'Ijin',
    icon: FluentIcons.notepad_32_regular,
    routeName: '/permission',
  ),
  HomeButtonEntities(
    title: 'Penghasilan',
    icon: FluentIcons.wallet_48_regular,
    routeName: '/salary',
  ),
];
