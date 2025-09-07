

import 'dart:developer';
import 'dart:io';

import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/common/app_snackber.dart';
import '../../data/hospital_flow/get_hospital_information_model.dart';

class HospitalRepo{

  final supabase = Supabase.instance.client;

  Future<List> getMeAsHospital() async{

    var response = [];
    try{
      // Upload profile image
      response = await Supabase.instance.client
          .from("user_profiles")
          .select("*")
          .eq('id', AuthService.id.toString());

      log("User id is: ${AuthService.id.toString()}");
      log("Response is: ${response[0].toString()}");
      return response;
    }catch(e){
      log("❌ Fetch error: $e");
    }
    return response;
  }

  Future<bool> updatePicture({required String path, required String file}) async{
    try{
      // Upload profile image
      final response = await Supabase.instance.client.storage
          .from("user_pictures")
          .update(path, File(file));
      if(response.isEmpty){
        return false;
      }else{
        return true;
      }
    }catch(e){
      log("❌ Upload error: $e");
    }
    return false;
  }

  Future<List<Map<String, dynamic>>?> updateHospitalInformation(
      Map<String, dynamic> requestBody) async {
    try {
      final response = await Supabase.instance.client
          .from("user_profiles")
          .update({"profileDetails": requestBody})
          .eq('id', AuthService.id.toString())
          .select(); // ✅ ensures you get the updated row(s)

      return response; // this is a List<Map<String, dynamic>>
    } catch (e) {
      log("❌ Fetch error: $e");
      return null;
    }
  }

  Future<String> uploadProfilePicture({required String path, required String file}) async{
    try{
      // Upload profile image
      await Supabase.instance.client.storage
          .from("user_pictures")
          .update(path, File(file),
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
          .update(path, File(file),
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

  Future<List> changePassword({required String currentPassword, required String newPassword}) async{

    var response = [];
    try{
      // Upload profile image
      final response = await Supabase.instance.client
          .from("user_profiles")
          .update({"password": newPassword})
          .eq('id', AuthService.id.toString())
          .eq('password', currentPassword)
          .select();

      return response;

    }catch(e){
      log("❌ Upload error: $e");
    }
    return response;
  }

  Future<bool> createEvent(Map<String, dynamic> requestBody) async{
    try{
      final response = await supabase.from("vaccines").insert(requestBody).select();
      if(response is List){
        Get.back();
        AppSnackBar.showSuccess("Event Created Successfully");
        log(response.toString());
        return true;
      }
      else{
        Get.back();
        AppSnackBar.showSuccess("Failed to create event!");
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