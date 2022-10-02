import 'package:flutter/material.dart';
import 'package:veegil_bank/component/style.dart';

class MainButton extends StatelessWidget {
  final Function()? onTap;
  final Color? backgroundColor;
  final Widget text;
  const MainButton(
      {Key? key, this.onTap, this.backgroundColor, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12.0)),
        height: 50.0,
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
