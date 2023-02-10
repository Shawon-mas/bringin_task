

import 'package:bringin_task/utilites/shared_prefs.dart';

class ApiServices{

static const String BASE_URL='https://bringin.io/api/';
//auth url
static const String OTP_URL='${BASE_URL}sendOTP';
static const String OTP_URL_LOGIN='${BASE_URL}setLoginWithOTP';
//profile url
static const String USER_UPDATE_URL='${BASE_URL}seekerProfileUpdate';
static const String GET_USER_PROFILE='${BASE_URL}getSeekerInfo';



  Map<String, String> defaultHeader = {
    'Accept': 'application/json',
  };

Future<Map<String, String>> headerWithToken() async{
    var getHeaderWithToken = {
    'Accept':'application/json',
    'Authorization':'${await SharedPrefs().getToken()}'
  };
    return getHeaderWithToken;

  }

}
class ApiKeyName{
  //otp
  static const String OTP_NUMBER='phone';
  static const String USER_ROLE='role';
  //user profile key

  static const String USER_FIRST_NAME='firstName';
  static const String USER_LAST_NAME='lastName';
  static const String USER_DOB='DOB';
  static const String USER_GENDER='gender';
  static const String USER_EDUCATION='educationLevel';
  static const String USER_BIO='bio';
  static const String USER_isExperience='isExperience';
  static const String USER_SKILLS='skills';
  static const String USER_GREETING='greeting';
  //user image key
  static const String USER_PROFILE_PICTURE='photo';


}
