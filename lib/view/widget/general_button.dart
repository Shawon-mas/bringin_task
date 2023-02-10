import 'package:flutter/material.dart';

import '../../utilites/colors.dart';


class GeneralButton extends StatelessWidget {
  final Color buttonColor;
  final Color? textColor;
  final String value;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;

  const GeneralButton({
    Key? key,
    required this.buttonColor,
    required this.onPressed,
    required this.value,
    this.textColor,
    this.isLoading = false, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: 40,
      color: buttonColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
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
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
      onPressed: onPressed,
    );
  }
}
