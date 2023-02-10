import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/colors.dart';
import '../../utilites/images.dart';
import '../widget/circular_container_widget.dart';
import '../widget/general_button.dart';
import '../widget/text_widget.dart';
class LoginRoleScreen extends StatelessWidget {
  const LoginRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [


              TextField(

                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10), child: Text('+91     |')),
                  prefixStyle: TextStyle(color: Colors.black),

                ),
              ),
              TextWidget(
                value: 'Choose Your Role',
                textColor: MyColors.fontColor,
                fontWeight: FontWeight.bold,
                size: 23.sp,
              ),
              CircularContainer(
                image: MyImage.jobSeeker,
                text: 'Looking\nfor a Job?',
                top: 20.h,
              ),
              GeneralButton(
                buttonColor: MyColors.secondaryColor,
                onPressed: (){
                },
                value: 'Join as Job Seeker',
                width: 200.w,
              ),
              SizedBox(height: 40.h,),
              CircularContainer(
                image: MyImage.recruiter,
                text: 'Need\nCandidate\nInstantly?',
                top: -10.h,
                right: -10,
              ),
              GeneralButton(
                buttonColor: MyColors.secondaryColor,
                onPressed: (){
                },
                value: 'Join as Recruiter',
                width: 200.w,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
