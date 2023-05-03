import 'package:flutter/material.dart';

class HorizontalLoadingIndicator extends StatefulWidget {
  const HorizontalLoadingIndicator({super.key});

  @override
  State<HorizontalLoadingIndicator> createState() =>
      _HorizontalLoadingIndicatorState();
}

class _HorizontalLoadingIndicatorState extends State<HorizontalLoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: LinearProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Linear progress indicator',
        ),
      ),
    );
  }
}
