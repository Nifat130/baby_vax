

import 'dart:developer';
import 'dart:io';

import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
          .update(path, File(file),);

      // String profileUrl = Supabase.instance.client.storage
      //     .from('user_pictures')
      //     .getPublicUrl(path);

      //log("✅ Profile URL: $profileUrl");
      if(response.isEmpty){
        return false;
      }
      return true;
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


}