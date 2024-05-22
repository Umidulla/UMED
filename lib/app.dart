import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/no_network.dart';
// import 'package:flutter_application_1/ui/pages/welcome_pages.dart';
import 'package:flutter_application_1/ui/router/app_router.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return AnnotatedRegion(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        noAppBar: true,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: StreamBuilder<List<ConnectivityResult>>(
        stream: connectivity.onConnectivityChanged,
        builder: (context, AsyncSnapshot<List<ConnectivityResult>> snapshot) {
          if (snapshot.data?[0] != ConnectivityResult.none) {
            return const MyAppContent();
          }
          return const MaterialApp(
            home: NoNetwork(),
          );
        },
      ),
    );
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FileViewLocalizationsDelegate.delegate,
      ],
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
