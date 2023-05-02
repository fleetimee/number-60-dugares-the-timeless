import 'package:bpd_hris/common/const/string_constant.dart';
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

  HomeHelpListEntities({
    required this.title,
    required this.content,
    required this.imagePath,
    required this.status,
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
  ),
  HomeHelpListEntities(
    title: 'Penerangan Jalan Umum',
    content:
        'Penerangan jalan umum (PJU) di Jalan Kaliurang, Sleman, Yogyakarta, tidak menyala. Hal ini membuat pengendara kesulitan melintas di malam hari.',
    imagePath: 'assets/images/home_help_image2.jpg',
    onTap: () {},
    status: 'Lapor',
  ),
  HomeHelpListEntities(
    title: 'Pengaduan Jalan Rusak',
    content:
        'Jalan di Jalan Kaliurang, Sleman, Yogyakarta, rusak parah. Hal ini membuat pengendara kesulitan melintas di malam hari.',
    imagePath: 'assets/images/home_help_image3.jpg',
    onTap: () {},
    status: 'Dikerjakan',
  ),
  HomeHelpListEntities(
      title: 'Pengaduan Jalan Rusak',
      content:
          'Jalan di Jalan Kaliurang, Sleman, Yogyakarta, rusak parah. Hal ini membuat pengendara kesulitan melintas di malam hari.',
      imagePath: 'assets/images/home_help_image4.jpg',
      onTap: () {},
      status: 'Selesai'),
  HomeHelpListEntities(
      title: 'Saluran Air Tersumbat',
      content:
          'Saluran air di Jalan Kaliurang, Sleman, Yogyakarta, tersumbat. Hal ini membuat pengendara kesulitan melintas di malam hari.',
      imagePath: 'assets/images/home_help_image5.jpg',
      onTap: () {},
      status: 'Selesai'),
  HomeHelpListEntities(
      title: 'Pengaduan Jalan Rusak',
      content:
          'Jalan di Jalan Kaliurang, Sleman, Yogyakarta, rusak parah. Hal ini membuat pengendara kesulitan melintas di malam hari.',
      imagePath: 'assets/images/home_help_image6.jpg',
      onTap: () {},
      status: 'Selesai'),
];
