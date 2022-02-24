import 'package:flutter/material.dart';
import 'package:fsdh_mobile/views/screens/report.dart';

import 'views/screens/login.dart';

//route generator
Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      // final Map args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
        settings: const RouteSettings(name: LoginView.routeName),
      );
    case ReportView.routeName:
      // final Map args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => const ReportView(),
        settings: const RouteSettings(name: ReportView.routeName),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
        settings: const RouteSettings(name: LoginView.routeName),
      );
  }
}
