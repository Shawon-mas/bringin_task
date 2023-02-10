import 'package:bringin_task/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/colors.dart';

class CircularContainer extends StatelessWidget {
  final String image;
  final String? text;
  final double? top;
  final double? left;
  final double? right;

  const CircularContainer(
      {Key? key, required this.image, this.text, this.top, this.left, this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.center,
     // fit: StackFit.expand,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200.h,
            width: 200.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(136, 104, 253, 174),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                )),
          ),
        ),
        Positioned(
          top: top,
          left: left,
          right: right,
          child: TextWidget(
            value: text.toString(),
            textColor: MyColors.fontColor,
            fontWeight: FontWeight.bold,
            size: 16.sp,
          ),
        ),
      ],
    );
  }
}
