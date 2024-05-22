import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/router/app_routes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: const Color.fromRGBO(34, 96, 255, 1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Sozlamalar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(34, 96, 255, 1),
          ),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 40),
        children: <Widget>[
          SettingsItem(
            iconData: Icons.lightbulb_outline,
            text: 'Bildirishnoma sozlamalari',
            myFunction: () {
              Navigator.of(context).pushNamed(AppRoutes.notification);
            },
          ),
          const SizedBox(height: 20),
          SettingsItem(
            iconData: Icons.key_outlined,
            text: 'Parolni o`zgartirish            ',
            myFunction: () {
              Navigator.of(context).pushNamed(AppRoutes.passReset);
            },
          ),
          const SizedBox(height: 20),
          SettingsItem(
            iconData: Icons.person_outlined,
            text: 'Profilni o`chirish                ',
            myFunction: () {},
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function myFunction;
  const SettingsItem({
    super.key,
    required this.iconData,
    required this.text,
    required this.myFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          size: 24,
          color: const Color(0xff171FEE),
        ),
        const SizedBox(width: 18),
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        IconButton(
          alignment: Alignment.centerRight,
          icon: const Icon(Icons.arrow_forward_ios_sharp),
          color: const Color.fromRGBO(34, 96, 255, 1),
          onPressed: () => myFunction(),
        ),
      ],
    );
  }
}
