import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/colors.dart';


class GeneralButton extends StatelessWidget {
  final Color buttonColor;
  final Color? textColor;
  final String value;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? radius;

  const GeneralButton({
    Key? key,
    required this.buttonColor,
    required this.onPressed,
    required this.value,
    this.textColor,
    this.isLoading = false, this.width, this.radius=15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: 40,
      color: buttonColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
      child: !isLoading
          ? Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: textColor,
              ),
            )
          : Center(
              child: SizedBox(
                height: 30.h,
                width: 30.w,
                child: CircularProgressIndicator(
                  color: Colors.greenAccent,
                ),
              ),
            ),
      onPressed: onPressed,
    );
  }
}
