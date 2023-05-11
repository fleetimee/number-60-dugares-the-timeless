import 'package:bpd_hris/data/entities/homo.entities.dart';
import 'package:bpd_hris/ui/home/components/home_ui_date_card.dart';
import 'package:bpd_hris/ui/home/components/home_ui_top_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          60,
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'BPDDIY HRMIS',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                // Trigger popup menu button on click
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(
                    100,
                    75,
                    0,
                    0,
                  ),
                  items: [
                    const PopupMenuItem(
                      child: Text(
                        'Logout',
                      ),
                    ),
                  ],
                );
              },
              icon: const Icon(
                Icons.more_vert_outlined,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 150,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Positioned(
              child: ClipPath(
                clipper: WaveClipperOne(
                    reverse: false), // Custom clipper for the bottom wave
                child: Container(
                  height: 150,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const BpdDiyHomeBody(),
          ],
        ),
      ),
    );
  }
}

class BpdDiyHomeBody extends StatelessWidget {
  const BpdDiyHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HomeTopCard(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(50, 70, 0),
                height: 150,
                width: double.infinity,
                child: ClipPath(
                  clipper:
                      WaveClipperTwo(), // Custom clipper for the bottom wave
                  child: Container(
                    height: 150,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const HomeCardButton(),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Container(
                transform: Matrix4.translationValues(-30, -31, 0),
                height: 150,
                width: double.infinity,
                child: ClipPath(
                  clipper:
                      DiagonalPathClipperTwo(), // Custom clipper for the bottom wave
                  child: Container(
                    height: 150,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const HomeDateCard(),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FluentIcons.service_bell_24_regular,
                    ),
                  ),
                  const Text(
                    'Informasi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const SliderContainer()
        ],
      ),
    );
  }
}

class HomeCardButton extends StatelessWidget {
  const HomeCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.17,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Center(
        child: GridView.builder(
          itemCount: homeButtonEntitiesList.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 12,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                IconButton(
                  onPressed: () {
                    context.push(homeButtonEntitiesList[index].routeName);
                  },
                  icon: Icon(
                    homeButtonEntitiesList[index].icon,
                    size: 48,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 1.0,
                ),
                Text(
                  homeButtonEntitiesList[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HomeCutiCard extends StatelessWidget {
  const HomeCutiCard({
    super.key,
    required this.day,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity * 0.3,
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E88E5),
            Color(0xFF64B5F6),
          ],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 12,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Sisa Cuti Tahunan Anda $day Hari',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}

class SliderContainer extends StatefulWidget {
  const SliderContainer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SliderContainerState createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  final List<String> items = [
    'Slide 1',
    'Slide 2',
    'Slide 3',
  ];

  int _currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: items.map((item) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child: Center(
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 22.0),
                ),
              ),
            );
          }).toList(),
          carouselController: carouselController,
          options: CarouselOptions(
            height: 150.0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
