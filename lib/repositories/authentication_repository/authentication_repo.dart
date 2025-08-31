

import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepo{

  final supabase = Supabase.instance.client;
  Future<bool> createHospitalProfile(Map<String, dynamic> requestBody) async{

    try{
      showProgressIndicator();
      final response = await supabase.from("hospital_profiles").insert(requestBody).select();
      if(response is List){
        Get.back();
        AppSnackBar.showSuccess("Profile created successfully!!");
        log(response.toString());
        return true;
      }
      else{
        Get.back();
        AppSnackBar.showSuccess("Failed to create profile!");
        log(response.toString());
      }
    }catch(e){
      if (e is PostgrestException) {
        log("Error Code: ${e.code}");
        log("Message: ${e.message}");
        log("Details: ${e.details}");
        log("Hint: ${e.hint}");

        // Show a nice error message to user
        if (e.code == '23505') { // duplicate key
          Get.back();
          AppSnackBar.showError("Email already exists. Please use another email.");
        } else {
          Get.back();
          AppSnackBar.showError(e.message);
        }
      } else {
        log("Unexpected error: $e");
        AppSnackBar.showError("Something went wrong. Try again.");
      }
    }

    return false;
  }
}