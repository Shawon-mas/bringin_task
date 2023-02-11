import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/auth_controller.dart';
import '../../utilites/colors.dart';
import '../../utilites/global_constants.dart';
import '../widget/appbar_widget.dart';
import '../widget/custom_textfield.dart';
import '../widget/general_button.dart';
import '../widget/text_widget.dart';
import 'otp_screen.dart';

class AuthScreen extends StatelessWidget {
  final _controller = Get.put(AuthController());
   AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text='If you already have account you will be log in to your profile. Otherwise you will be given the option to set a new profile.';

    return Scaffold(
      appBar: const CommonToolbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              value: 'Sign In / Sign Up',
              textColor: MyColors.fontColor,
              fontWeight: FontWeight.w700,
              size: 28.sp,
            ),
            TextWidget(
              value: 'Job Seeker',
              textColor: MyColors.fontColor,
              fontWeight: FontWeight.w700,
              size: 28.sp,
            ),
            SizedBox(height: 10.h,),
            TextWidget(
              value: text,
              textColor: MyColors.fontColor,
              fontWeight: FontWeight.w400,
              size: 14.sp,
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(2,2),
                    spreadRadius:0
                  )
                ]
              ),
              child: CustomTextField(
                inputType: TextInputType.number,
                hintText: 'Phone Number',
                controller: _controller.phoneController,
              ),
            ),
            SizedBox(height: 10.h,),
            Obx(()  {
              return GeneralButton(
                isLoading: _controller.isSendingOtp.value,
                buttonColor: MyColors.buttonColor,
                onPressed: (){
                  if(_controller.phoneController.text.toString().isEmpty){
                    errorSnackBar(context, 'Phone number required');
                  }else if(_controller.phoneController.text.length<11) {
                    errorSnackBar(context, "Number Should Be 11 Digit");

                  }
                  else{
                   _controller.sendApiOtp(context, _controller);
                   // Get.to(()=>OtpScreen(controller: _controller));
                  }
                },
                value: 'Send Code',
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


