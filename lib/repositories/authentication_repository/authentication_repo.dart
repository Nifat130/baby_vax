import 'dart:developer';
import 'dart:io';
import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepo{

  final supabase = Supabase.instance.client;

  Future<String> uploadProfilePicture({required String path, required String file}) async{
    try{
      // Upload profile image
      await Supabase.instance.client.storage
          .from("user_pictures")
          .upload(path, File(file),
          fileOptions: const FileOptions(upsert: true));

      String profileUrl = Supabase.instance.client.storage
          .from('user_pictures')
          .getPublicUrl(path);

      log("✅ Profile URL: $profileUrl");
      return profileUrl;

    }catch(e){
      log("❌ Upload error: $e");
    }
    return "failed";
  }

  Future<String> uploadLicensePicture({required String path, required String file}) async{
    try{
      // Upload profile image
      await Supabase.instance.client.storage
          .from("user_pictures")
          .upload(path, File(file),
          fileOptions: const FileOptions(upsert: true));

      String licenseUrl = Supabase.instance.client.storage
          .from('user_pictures')
          .getPublicUrl(path);

      log("✅ License URL: $licenseUrl");
      return licenseUrl;

    }catch(e){
      log("❌ Upload error: $e");
    }
    return "failed";
  }

  Future<bool> createAccount(Map<String, dynamic> requestBody) async{
    try{
      final response = await supabase.from("user_profiles").insert(requestBody).select();
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

  Future<List> signInToAccount({required String email, required String password}) async{

    List response = [];
    try{
      final response = await supabase.from("user_profiles").select("id, email, role").eq("email", email).eq("password", password);
      log(response.toString());
      return response;

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

    return response;
  }

}