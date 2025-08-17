

import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/core/services/network_caller.dart';
import 'package:baby_vax/core/utils/constants/app_urls.dart';
import 'package:baby_vax/features/authentication/data/models/get_user_info_while_login_model.dart';
import 'package:baby_vax/features/authentication/data/models/get_user_information_model.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class AuthenticationRepository{
  
  
  Future<void> dummy() async{
    try{
      
    }catch(e){
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> signUp(Map<String, dynamic> requestBody) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.signUp, body: requestBody);

      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess("OTP send to your email!!");
        final token = response.responseData["result"]["token"];
        AuthService.saveToken(token, "01154");
        log(AuthService.token.toString());
        Get.toNamed(AppRoute.verifyScreen);
      }
      else if(response.statusCode == 409){
        Get.back();
        AppSnackBar.showError("User already exist!!");
      }
      else{
        Get.back();
        AppSnackBar.showError("Failed to create account!");
        log(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> login(Map<String, dynamic> requestBody) async{
    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.login, body: requestBody);

      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess("User login successful!!");
        final data = response.responseData;
        final information = GetUserInfoWhileLoginModel.fromJson(data);
        AuthService.saveToken(information.result!.accessToken!, information.result!.userInfo!.id!);
        information.result!.userInfo!.role == 'FACILITY' ?
        Get.toNamed(AppRoute.facilitiesNavBar) :
        Get.toNamed(AppRoute.navBarScreen);
      }
      else if(response.statusCode == 401){
        Get.back();
        AppSnackBar.showError("Wrong password!!");
      }
      else{
        Get.back();
        AppSnackBar.showError("Failed to login!!");
        log(response.statusCode.toString());
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> resendOTP(Map<String, dynamic> requestBody) async{
    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.resendOTP, body: requestBody);

      if(response.isSuccess){
        Get.back();
        final data = response.responseData;
        AuthService.saveToken(data['result']['token'], "1245");
        Get.toNamed(AppRoute.forgottenVerifyScreen);
        AppSnackBar.showSuccess("OTP send to your email!!");
      }
      else{
        Get.back();
        AppSnackBar.showError("Failed to send OTP!!");
        log(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> signUpVerifyOTP(Map<String, dynamic> requestBody) async{
    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.verifyOTP, body: requestBody);
      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess("OTP verified successfully!!");
        log("==================================================================");
        log(response.responseData['result']);
        AuthService.saveToken(response.responseData['result'].toString(), "1451");
        if (AuthService.userRole != "FACILITY") {
          Get.toNamed(AppRoute.profileSetupIndicator);
        } else {
          Get.toNamed(AppRoute.facilitiesProfileSetupScreen);
        }
      }
      else{
        Get.back();
        AppSnackBar.showError("Wrong OTP!!");
        log(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> verifyOTP(Map<String, dynamic> requestBody) async{
    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.verifyOTP, body: requestBody);
      if(response.isSuccess){
        Get.back();
        final data = response.responseData;
        AuthService.saveToken(data['result'], "1465");
        AppSnackBar.showSuccess("OTP verified successfully!!");
        Get.toNamed(AppRoute.createNewPassword);
      }
      else{
        Get.back();
        AppSnackBar.showError("Wrong OTP!!");
        log(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }


  Future<void> resetPassword(Map<String, dynamic> requestBody) async{
    try{
      showProgressIndicator();
      final response = await NetworkCaller().patchRequest(AppUrls.resetPassword, body: requestBody);
      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess("Password Changed Successfully!!");
        Get.toNamed(AppRoute.passwordChangeSuccess);
      }
      else{
        Get.back();
        AppSnackBar.showError("Failed to change password!!");
        log(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }
  
  /// User Information Fetching

  Future<GetUserInformation> getUserInformation() async{

    var userInformation = GetUserInformation();
    try{
      final response = await NetworkCaller().getRequest(AppUrls.getMe);

      if(response.isSuccess){
        final data = response.responseData;
        userInformation = GetUserInformation.fromJson(data);
        return userInformation;
      }
      else{
        AppSnackBar.showError("Internet issue!!");
        log(response.statusCode.toString());
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }
    return userInformation;
  }

}