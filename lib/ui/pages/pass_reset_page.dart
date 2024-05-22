import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/component/primary_btn.dart';
import 'package:flutter_application_1/ui/pages/auth_page.dart';

class PassResetPage extends StatelessWidget {
  const PassResetPage({super.key});

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
          'Parolni o`zgartirish',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(34, 96, 255, 1),
          ),
        ),
      ),
      body: const PassResetPageContent(),
    );
  }
}

class PassResetPageContent extends StatelessWidget {
  const PassResetPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Form(
        child: Column(
          children: <Widget>[
            const AuthPageFormItem(
              title: 'Yangi parolni kiriting',
              hintText: '***********',
              isPassword: true,
            ),
            const SizedBox(height: 16),
            const AuthPageFormItem(
              title: 'Parolni tasdiqlang',
              hintText: '***********',
              isPassword: true,
            ),
            const SizedBox(height: 40),
            PrimaryBtn(
              bgColor: const Color.fromRGBO(123, 92, 249, 1),
              heroTag: 'Auth',
              btnAction: () {},
              btnText: 'Yangi parolni yaratish',
            )
          ],
        ),
      ),
    );
  }
}
