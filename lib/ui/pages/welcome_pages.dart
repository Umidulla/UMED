import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/component/primary_btn.dart';
import 'package:flutter_application_1/ui/router/app_routes.dart';

class WelcomePages extends StatelessWidget {
  const WelcomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: const Color.fromRGBO(105, 250, 250, 1),
      childWidget: const WelcomePageSplashScreen(),
      nextScreen: const WelcomePageContent(),
    );
  }
}

class WelcomePageSplashScreen extends StatelessWidget {
  const WelcomePageSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/Heart.png',
            width: 80,
          ),
          const SizedBox(height: 28),
          const Text(
            'UMED',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(255, 34, 167, 1),
            ),
          ),
          const Text(
            'Shifokor maslahati',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(255, 34, 167, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomePageContent extends StatelessWidget {
  const WelcomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/Heart.png',
                width: 80,
              ),
              const SizedBox(height: 28),
              const Text(
                'UMED',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 34, 167, 1),
                ),
              ),
              const Text(
                'Shifokor maslahati',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 34, 167, 1),
                ),
              ),
              const SizedBox(
                width: 320,
                child: Text(
                  'Tizimga kirishingiz uchun ro`yhatdan o`tgan bo`lishingiz zarur',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              PrimaryBtn(
                btnAction: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                heroTag: 'Register',
                btnText: 'Ro`yhatdan o`tish',
                bgColor: const Color.fromRGBO(123, 92, 249, 1),
              ),
              const SizedBox(height: 24),
              PrimaryBtn(
                btnAction: () {
                  Navigator.pushNamed(context, AppRoutes.auth);
                },
                heroTag: 'Auth',
                btnText: 'Kirish',
                bgColor: const Color.fromRGBO(72, 190, 126, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
