import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
          'Bildirishnoma sozlamalari',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(34, 96, 255, 1),
          ),
        ),
      ),
      body: const NotificationItem(),
    );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool switchValue1 = true;
  bool switchValue2 = true;
  bool switchValue3 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SwitchListTile(
            title: const Text(
              'Xabarnoma',
              style: TextStyle(fontSize: 20),
            ),
            value: switchValue1,
            onChanged: (value) {
              setState(() {
                switchValue1 = value;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SwitchListTile(
            title: const Text(
              'Qo`ng`iroq tovushi',
              style: TextStyle(fontSize: 20),
            ),
            value: switchValue2,
            onChanged: (value) {
              setState(() {
                switchValue2 = value;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SwitchListTile(
            title: const Text(
              'Vibratsiya',
              style: TextStyle(fontSize: 20),
            ),
            value: switchValue3,
            onChanged: (value) {
              setState(() {
                switchValue3 = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
