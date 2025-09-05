

import 'dart:developer';

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

      return response;
    }catch(e){
      log("❌ Fetch error: $e");
    }
    return response;
  }
}