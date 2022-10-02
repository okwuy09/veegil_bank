import 'package:flutter/material.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/style.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 55,
            width: 53,
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: icon,
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: style.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }
}
