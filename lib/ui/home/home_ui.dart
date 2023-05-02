import 'package:bpd_hris/data/entities/homo.entities.dart';
import 'package:bpd_hris/ui/home/components/home_ui_header_text.dart';
import 'package:bpd_hris/ui/home/components/home_ui_help_menu_card.dart';
import 'package:bpd_hris/ui/home/components/home_ui_service_menu_card.dart';
import 'package:bpd_hris/ui/home/components/home_ui_top_card.dart';
import 'package:flutter/material.dart';

import '../../common/const/string_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const HomeTopCard(),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: HomeHeaderText(
                    title: StringConstant.service,
                    subtitle: StringConstant.serviceSubtitle,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 300,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeMenuGridEntities.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return HomeMenuGrid(
                        imagePath: homeMenuGridEntities[index].imagePath,
                        title: homeMenuGridEntities[index].title,
                        index: index,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: HomeHeaderText(
                    title: StringConstant.help,
                    subtitle: StringConstant.helpSubtitle,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    itemCount: homeHelpListEntities.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 18.0,
                      );
                    },
                    itemBuilder: (context, index) {
                      return HomeHelpListCard(
                        index: index,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: HomeHeaderText(
                    title: StringConstant.shortcut,
                    subtitle: StringConstant.shortcutSubtitle,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 150,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeShortcutGridEntities.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return HomeMenuGrid(
                        imagePath: homeShortcutGridEntities[index].imagePath,
                        title: homeShortcutGridEntities[index].title,
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
