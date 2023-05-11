import 'package:bpd_hris/common/utils/transisiton.dart';
import 'package:bpd_hris/ui/home/home_ui.dart';
import 'package:bpd_hris/ui/presence_maps/presence_maps_ui.dart';
import 'package:bpd_hris/ui/salary/salary_ui.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: '/presence',
      builder: (context, state) => const PresenceMapPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const PresenceMapPage(),
      ),
    ),
    GoRoute(
      path: '/salary',
      builder: (context, state) => const SalaryPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SalaryPage(),
      ),
    ),
  ],
);
