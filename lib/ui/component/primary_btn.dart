import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final Color bgColor;
  final String btnText;
  final String heroTag;
  final Function btnAction;
  const PrimaryBtn({
    super.key,
    this.btnText = '',
    required this.bgColor,
    required this.heroTag,
    required this.btnAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 200,
      child: FloatingActionButton.extended(
        heroTag: heroTag,
        onPressed: () => btnAction(),
        elevation: 0,
        backgroundColor: bgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        label: Text(
          btnText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
