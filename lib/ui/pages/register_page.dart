import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/component/primary_btn.dart';
import 'package:flutter_application_1/ui/pages/auth_page.dart';
import 'package:flutter_application_1/ui/router/app_routes.dart';
import 'package:flutter_file_view/flutter_file_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          'Yangi foydalanuvchi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(34, 96, 255, 1),
          ),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
        children: [
          Column(
            children: <Widget>[
              const RegisterPageForm(),
              const SizedBox(height: 8),
              const RegisterPageFooter(),
              const SizedBox(height: 8),
              PrimaryBtn(
                btnAction: () {
                  Navigator.of(context).pushNamed(AppRoutes.auth);
                },
                heroTag: 'Register',
                btnText: 'Ro`yhatdan o`tish',
                bgColor: const Color.fromRGBO(123, 92, 249, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RegisterPageForm extends StatelessWidget {
  const RegisterPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: <Widget>[
          AuthPageFormItem(
            hintText: 'Usmon',
            title: 'To`liq ismingiz',
          ),
          SizedBox(height: 8),
          AuthPageFormItem(
            isPassword: true,
            hintText: '**************',
            title: 'Parolingizni kiriting',
          ),
          SizedBox(height: 8),
          AuthPageFormItem(
            hintText: 'examle@examle.com',
            title: 'Elektron pochta',
          ),
          SizedBox(height: 8),
          AuthPageFormItem(
            isPhoneInput: true,
            hintText: '+123 45 678 91 02',
            title: 'Telefon raqamingiz',
          ),
          SizedBox(height: 8),
          AuthPageFormItem(
            hintText: 'kun / oy / yil',
            title: 'Tug`g`ilgan sanangiz',
            isDateInput: true,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class RegisterPageFooter extends StatelessWidget {
  const RegisterPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(
        fontSize: 12, color: Color(0xff303030), fontWeight: FontWeight.w500);
    final FileViewController controller =
        FileViewController.asset('assets/documents/foydalanish_shartlari.docx');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Davom etish orqali',
          style: style,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  builder: (context) => Container(
                    color: Colors.white,
                  ),
                );
              },
              child: Text(
                ' foydalanish shartlari',
                style: style.copyWith(color: const Color(0xff2260FF)),
              ),
            ),
            const Text(' va '),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  builder: (context) => Container(
                    color: Colors.white,
                    child: FileView(controller: controller),
                  ),
                );
              },
              child: Text(
                'mahfiylik siyosatiga',
                style: style.copyWith(color: const Color(0xff2260FF)),
              ),
            ),
            const Text('rozilik', style: style),
          ],
        ),
        const Text('bergan bo`lasiz', style: style),
      ],
    );
  }
}
