import 'dart:async';

import 'package:bpd_hris/cubit/geolocator/geolocator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorListener extends StatefulWidget {
  final Widget child;

  const GeolocatorListener({Key? key, required this.child}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GeolocatorListenerState createState() => _GeolocatorListenerState();
}

class _GeolocatorListenerState extends State<GeolocatorListener> {
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    final geolocatorCubit = BlocProvider.of<GeolocatorCubit>(context);

    // access permission location on start app
    geolocatorCubit.requestPermission();

    // listen position stream
    _positionStreamSubscription =
        geolocatorCubit.positionStream.listen((position) {
      // Do something with the position here
      print(position.latitude);
    });
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
