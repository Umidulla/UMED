import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ui/component/primary_btn.dart';
import 'package:flutter_application_1/ui/router/app_routes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

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
            Navigator.of(context).pushNamed(AppRoutes.welcome);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Kirish',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(34, 96, 255, 1),
          ),
        ),
      ),
      body: const AuthPageContent(),
    );
  }
}

class AuthPageContent extends StatelessWidget {
  const AuthPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const <Widget>[
        SizedBox(
          width: 300,
          child: Text(
            'UMED ilovasiga hush kelibsiz!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(34, 96, 255, 1)),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          width: 300,
          child: Text(
            'Shaxsingizni tasdiqlash uchun telefon raqamingizni yoki elektron pochtangizni va parolingizni kiriting',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(height: 40),
        AuthPageForm(),
      ],
    );
  }
}

class AuthPageForm extends StatelessWidget {
  const AuthPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const AuthPageFormItem(
            title: 'Telefon raqam yoki elektron pochta',
            hintText: 'example@example.com',
          ),
          const SizedBox(height: 16),
          const AuthPageFormItem(
            title: 'Parol',
            hintText: '*************',
            isPassword: true,
            showBtn: true,
          ),
          const SizedBox(height: 40),
          PrimaryBtn(
            bgColor: const Color(0xff48BE7E),
            btnAction: () {
              Navigator.of(context).pushNamed(AppRoutes.home);
            },
            heroTag: 'Auth',
            btnText: 'Kirish',
          )
        ],
      ),
    );
  }
}

class AuthPageFormItem extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  final bool isPhoneInput;
  final bool isDateInput;
  final bool showBtn;

  const AuthPageFormItem({
    super.key,
    this.title = '',
    this.hintText = '',
    this.isPassword = false,
    this.isPhoneInput = false,
    this.isDateInput = false,
    this.showBtn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff303030),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        AuthPageInput(
          isPassword: isPassword,
          hintText: hintText,
          isPhoneInput: isPhoneInput,
          isDateInput: isDateInput,
          showBtn: showBtn,
        ),
      ],
    );
  }
}

class AuthPageInput extends StatefulWidget {
  const AuthPageInput({
    super.key,
    required this.isPassword,
    required this.hintText,
    required this.isPhoneInput,
    required this.isDateInput,
    required this.showBtn,
  });

  final bool isPassword;
  final String hintText;
  final bool isPhoneInput;
  final bool isDateInput;
  final bool showBtn;

  @override
  State<AuthPageInput> createState() => _AuthPageInputState();
}

class _AuthPageInputState extends State<AuthPageInput> {
  bool obscureText = false;

  void showPassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextInputFormatter phoneFormatter = MaskTextInputFormatter(
      mask: '+### ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager,
    );

    final TextInputFormatter dateFormatter = MaskTextInputFormatter(
      mask: '**/**/****',
      filter: {"*": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          onEditingComplete: () {
            myFocusNode.nextFocus();
          },
          focusNode: myFocusNode,
          inputFormatters: [
            if (widget.isDateInput) dateFormatter,
            if (widget.isPhoneInput) phoneFormatter,
          ],
          keyboardType: widget.isPhoneInput
              ? TextInputType.phone
              : widget.isDateInput
                  ? TextInputType.datetime
                  : TextInputType.text,
          obscureText: widget.isPassword ? !obscureText : obscureText,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff809CFF),
          ),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: showPassword,
                    child: Icon(obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined),
                  )
                : null,
            fillColor: const Color(0xffECF1FF),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xff809CFF),
            ),
          ),
        ),
        if (widget.showBtn)
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.passReset);
            },
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: const Text(
              'Parolni o`chirish',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff809CFF),
              ),
            ),
          ),
      ],
    );
  }
}
