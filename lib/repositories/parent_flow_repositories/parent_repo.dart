

import 'dart:developer';
import 'dart:io';

import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/common/app_snackber.dart';
import '../../core/services/Auth_service.dart';

class ParentRepo{

  final supabase = Supabase.instance.client;

  Future<List> getMeAsParent() async{

    var response = [];
    try{
      // Upload profile image
      response = await supabase
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

  Future<String> uploadChildrenPicture({required String path, required String file}) async{
    try{
      // Upload profile image
      await supabase.storage
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

  Future<bool> addChild(Map<String, dynamic> requestBody) async{
    try{
      final response = await supabase.from("children").insert(requestBody).select();
      if(response is List){
        log(response.toString());
        return true;
      }
      else{
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
          AppSnackBar.showError("Child already exists");
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

  Future<List> getMyChildren() async{

    var response = [];
    try{
      // Upload profile image
      response = await supabase
          .from("children")
          .select("*")
          .eq('parent_id', AuthService.id.toString());

      log("User id is: ${AuthService.id.toString()}");
      log("Response is: ${response[0].toString()}");
      return response;
    }catch(e){
      log("❌ Fetch error: $e");
    }
    return response;
  }

  Future<bool> updateChild(Map<String, dynamic> requestBody, String childId) async{

    try{
      final response = await supabase.from("children").update(requestBody).eq("id", childId);
      if(response == null){
        log(response.toString());
        return true;
      }
      else{
        log(response.toString());
      }
    }catch(e){
      log("❌ Fetch error: $e");
    }
    return false;
  }

  Future<bool> removeChild(String childId) async {
    try {
      final response = await supabase
          .from("children")
          .delete()
          .eq("id", childId)
          .select();

      if (response is List && response.isNotEmpty) {
        log("Child removed: $response");
        return true;
      } else {
        log("Delete response: $response");
      }
    } catch (e) {
      if (e is PostgrestException) {
        log("Error Code: ${e.code}");
        log("Message: ${e.message}");
        log("Details: ${e.details}");
        log("Hint: ${e.hint}");

        if (e.code == 'P0001') {
          // example: custom error from Postgres function
          AppSnackBar.showError("Unable to remove child");
        } else {
          AppSnackBar.showError(e.message);
        }
      } else {
        log("Unexpected error: $e");
        AppSnackBar.showError("Something went wrong. Try again.");
      }
    }

    return false;
  }


  Future<List> getVaccineEvents(String vaccineType) async{

    var response = [];
    try{
      // Upload profile image
      log("++++++++++++++++++++++++++++++++++++++++++++++++++++");
      log(vaccineType.toString());
      vaccineType != "All" ?
      response = await supabase
          .from("vaccine_events")
          .select("*")
          .eq('type', vaccineType):
      response = await supabase
          .from("vaccine_events")
          .select("*");

      AppLoggerHelper.info(response.toString());
      return response;
    }catch(e){
      AppLoggerHelper.error("❌ Fetch error: $e");
    }
    return response;
  }

  Future<bool> updateParent(Map<String, dynamic> requestBody) async{
    try{
      final response = await supabase.from("user_profiles").update({"profileDetails" : requestBody}).eq("id", AuthService.id.toString());
      if(response == null){
        log(response.toString());
        return true;
      }
      else{
        log(response.toString());
      }
    }catch(e){
      log("❌ Fetch error: $e");
    }
    return false;
  }
}