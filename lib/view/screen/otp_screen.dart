import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pinput/pinput.dart';

import '../../controller/auth_controller.dart';
import '../../utilites/colors.dart';
import '../../utilites/global_constants.dart';
import '../widget/appbar_widget.dart';
import '../widget/general_button.dart';
import '../widget/text_widget.dart';
class OtpScreen extends StatelessWidget {
  final AuthController controller;
  const OtpScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonToolbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              value: 'Verify Phone',
              textColor: MyColors.fontColor,
              fontWeight: FontWeight.w700,
              size: 28.sp,
            ),
            TextWidget(
              value: 'Code sent to ${controller.phoneController.text}',
              textColor: MyColors.fontColor,
              fontWeight: FontWeight.w300,
              size: 16.sp,
            ),
            SizedBox(height: 20.h,),
            Pinput(
              length: 4,
              // defaultPinTheme: defaultPinTheme,
              // focusedPinTheme: focusedPinTheme,
              // submittedPinTheme: submittedPinTheme,
              controller: controller.otpController,
              showCursor: true,
              onCompleted: (pin) =>
              {
                // controller.registerUser(pin, verificationId, context)
                controller.verifyOtp(context, pin),
                print(pin)
              },
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  edgeInsetsGeometry: EdgeInsets.zero,
                  value: 'Did not receive code?',
                  textColor: MyColors.fontColor,
                  fontWeight: FontWeight.w300,
                  size: 14.sp,
                ),
                SizedBox(width: 5.h,),
                TextWidget(
                  edgeInsetsGeometry: EdgeInsets.zero,
                  value: 'Send Again',
                  textColor: MyColors.fontColor,
                  fontWeight: FontWeight.w500,
                  size: 14.sp,
                ),
              ],
            ),

            SizedBox(height: 20.h,),

            Obx(()  {
              return GeneralButton(
                isLoading: controller.isVerifyingOtp.value,
                buttonColor: MyColors.buttonColor,
                onPressed: (){
                  if(controller.otpController.text.toString().isEmpty){
                    errorSnackBar(context, 'OTP required');
                  }
                  else{
                    controller.verifyOtp(context, controller.otpController.text);
                  }
                },
                value: 'Verify Otp',
                width: 115.w,
                radius: 6,
                textColor: Colors.black,

              );
            }),
          ],
        ),
      ),

    );
  }
}
