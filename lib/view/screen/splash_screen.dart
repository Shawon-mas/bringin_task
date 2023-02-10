import 'package:bringin_task/utilites/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/global_controller.dart';
import '../../utilites/images.dart';
import '../widget/text_widget.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(GlobalController());

   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCurrentUserFromServer();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          Image.asset(MyImage.logo),
          SizedBox(
            height: 20.h,
          ),
          TextWidget(
            value: 'Bringin',
            textColor: MyColors.fontColor,
            fontWeight: FontWeight.bold,
            size: 35.sp,
          ),
          SizedBox(
            height: 10.h,
          ),
          TextWidget(
            value: 'Instant Chat, Hire Direct',
            textColor: MyColors.fontColor,
            fontWeight: FontWeight.bold,
            size: 20.sp,
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: TextWidget(
                    value: 'Bringin Technologies Ltd.',
                    textColor: MyColors.fontColor,
                    fontWeight: FontWeight.bold,
                    size: 20.sp,
                  )),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
        ],
      ),
    );
  }
}
