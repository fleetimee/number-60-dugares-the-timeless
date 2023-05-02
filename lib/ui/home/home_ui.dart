import 'package:bpd_hris/data/entities/homo.entities.dart';
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 175,
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  homeHelpListEntities[index].imagePath,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: 175,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    child: Center(
                                      child: Text(
                                        homeHelpListEntities[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Status Card in the top left corner
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: 75,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                      color:
                                          homeHelpListEntities[index].status ==
                                                  'Selesai'
                                              ? Colors.green
                                              : homeHelpListEntities[index]
                                                          .status ==
                                                      'Dikerjakan'
                                                  ? Colors.orange
                                                  : Colors.red,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        homeHelpListEntities[index].status,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          SizedBox(
                            width: 175,
                            child: Text(
                              homeHelpListEntities[index].content,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 12.0,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeHeaderText extends StatelessWidget {
  const HomeHeaderText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18.0,
              ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 14.0,
              ),
        ),
      ],
    );
  }
}
