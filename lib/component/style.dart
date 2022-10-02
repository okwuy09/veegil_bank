import 'package:flutter/material.dart';
import 'package:veegil_bank/component/color.dart';

final style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: AppColor.primaryColor,
);

final buttonCircularIndicator = SizedBox(
  height: 25,
  width: 25,
  child: CircularProgressIndicator(
    backgroundColor: AppColor.lightGrey.withOpacity(0.6),
    valueColor: AlwaysStoppedAnimation(AppColor.white),
    strokeWidth: 4.0,
  ),
);

void successOperation(context) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(110),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_outlined,
              color: AppColor.white,
              //size: 2,
            ),
            const SizedBox(width: 10),
            Text(
              'Success',
              style: style.copyWith(color: AppColor.white),
            ),
          ],
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.8),
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );

void failedOperation(context) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(50),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_outlined,
              color: AppColor.white,
              //size: 2,
            ),
            const SizedBox(width: 10),
            Text(
              'Failed something is wrong',
              style: style.copyWith(color: AppColor.white),
            ),
          ],
        ),
        backgroundColor: AppColor.red.withOpacity(0.8),
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
