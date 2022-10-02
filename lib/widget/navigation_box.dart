import 'package:flutter/material.dart';
import 'package:veegil_bank/component/color.dart';

class NavigationBox extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  const NavigationBox({
    Key? key,
    required this.onTap,
    this.color = const Color(0xFF111827),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: color,
            size: 18,
          ),
        ),
      ),
    );
  }
}
