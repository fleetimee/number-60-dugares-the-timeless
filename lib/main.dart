import 'package:bpd_hris/common/utils/app_providers.dart';
import 'package:bpd_hris/common/utils/geolocator_listener.dart';
import 'package:bpd_hris/ui/presence_maps/presence_maps_ui.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: GeolocatorListener(
        child: MaterialApp(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          theme: FlexThemeData.light(
            appBarStyle: FlexAppBarStyle.primary,
            scheme: FlexScheme.aquaBlue,
            useMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          debugShowCheckedModeBanner: false,
          home: const PresenceMapPage(),
        ),
      ),
    );
  }
}
