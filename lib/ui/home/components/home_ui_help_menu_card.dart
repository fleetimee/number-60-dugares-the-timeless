import 'package:bpd_hris/data/entities/homo.entities.dart';
import 'package:flutter/material.dart';

class HomeHelpListCard extends StatelessWidget {
  const HomeHelpListCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
                    color: homeHelpListEntities[index].status == 'Selesai'
                        ? Colors.green
                        : homeHelpListEntities[index].status == 'Dikerjakan'
                            ? Colors.orange
                            : Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      homeHelpListEntities[index].status,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
        Padding(
          padding: const EdgeInsets.only(
            left: 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeHelpListEntities[index].date,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: 175,
                child: Text(
                  homeHelpListEntities[index].content,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 12.0,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
