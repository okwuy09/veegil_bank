import 'package:flutter/material.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/widget/button.dart';

class SuccessSheet extends StatefulWidget {
  final String message;

  const SuccessSheet({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<SuccessSheet> createState() => _SuccessSheetState();
}

class _SuccessSheetState extends State<SuccessSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(27),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: 109,
                width: 109,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(130),
                ),
              ),
              Positioned(
                top: 18,
                left: 18,
                child: Container(
                  height: 71,
                  width: 71,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.white),
                    borderRadius: BorderRadius.circular(130),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 40,
                    color: AppColor.white,
                  ),
                ),
              ),
            ],
          ),

          //
          const SizedBox(height: 40),
          Text(
            widget.message,
            style: style.copyWith(
              color: AppColor.darkGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          MainButton(
            text: Text(
              'Continue',
              style: style.copyWith(
                fontSize: 14,
                color: AppColor.white,
              ),
            ),
            backgroundColor: AppColor.primaryColor,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
