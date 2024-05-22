import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/auth_page.dart';

import 'package:flutter_application_1/ui/pages/home_page.dart';
import 'package:flutter_application_1/ui/pages/notification_page.dart';
import 'package:flutter_application_1/ui/pages/register_page.dart';
import 'package:flutter_application_1/ui/pages/settings.dart';
import 'package:flutter_application_1/ui/pages/welcome_pages.dart';
import 'package:flutter_application_1/ui/router/app_routes.dart';
import 'package:flutter_application_1/ui/pages/pass_reset_page.dart';

abstract final class AppRouter {
  static String get initialRoute => AppRoutes.welcome;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.welcome: (context) => const WelcomePages(),
        AppRoutes.auth: (context) => const AuthPage(),
        AppRoutes.register: (context) => const RegisterPage(),
        AppRoutes.passReset: (context) => const PassResetPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.settings: (context) => const Settings(),
        AppRoutes.notification: (context) => const NotificationPage(),
      };
}
