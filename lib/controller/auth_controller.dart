import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utilites/api_services.dart';
import '../utilites/global_constants.dart';
import '../utilites/shared_prefs.dart';
import '../view/screen/home_screen.dart';
import '../view/screen/otp_screen.dart';

class AuthController extends GetxController{
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  var isSendingOtp = false.obs;
  var isVerifyingOtp = false.obs;



  sendApiOtp(BuildContext context, AuthController _controller) async{
    isSendingOtp.value = true;
    Map<String,dynamic> body={
      ApiKeyName.OTP_NUMBER:phoneController.text.toString(),
      ApiKeyName.USER_ROLE:'seekers',

    };
    try{
      var response=await http.post(Uri.parse(ApiServices.OTP_URL),
          body: body,
          headers: ApiServices().defaultHeader
      );
      if(response.statusCode==200){
        print(response.body);
        isSendingOtp.value = false;
        print('Otp Sent');
        Get.to(()=>OtpScreen(controller: _controller));

      }

    }catch(e){
      isSendingOtp.value = false;
      errorSnackBar(context, 'Something Went Wrong');
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }
  verifyOtp(BuildContext context, String otp) async{
    print(otp);
    print(phoneController.text.toString());
    isVerifyingOtp.value = true;
    Map<String,dynamic> body={
      ApiKeyName.OTP_NUMBER:phoneController.text.toString(),
      ApiKeyName.USER_OTP:otp,

    };
    try{
      var response=await http.post(Uri.parse(ApiServices.OTP_URL_VERIFY),
          body: body,
          headers: ApiServices().defaultHeader
      );
      if(response.statusCode==200){
        print(response.body);
        isVerifyingOtp.value = false;
        var data=json.decode(response.body);
        var result=data['data'];
        print(result['token']);
        await SharedPrefs().saveToken(result['token']);
        print(await SharedPrefs().getToken());
        if(result['isNew']==true)
        {
          await SharedPrefs().isLogin(true);
          errorSnackBar(context, 'Do not complete profile');
          Get.offAll(()=>HomeScreen());
        }else{
          await SharedPrefs().isLogin(true);
          Get.offAll(()=>HomeScreen());
        }
        print('Verify');


      }

    }catch(e){
      isVerifyingOtp.value = false;
      errorSnackBar(context, 'Something Went Wrong');
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }
}