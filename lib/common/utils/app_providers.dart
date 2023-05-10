import 'package:bpd_hris/cubit/geolocator/geolocator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeolocatorCubit>(
          create: (context) => GeolocatorCubit(),
        ),
      ],
      child: child,
    );
  }
}
