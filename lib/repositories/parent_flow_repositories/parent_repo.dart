

import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/services/Auth_service.dart';

class ParentRepo{

  final supabase = Supabase.instance.client;

  Future<List> getMeAsParent() async{

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
}