// ignore_for_file: file_names

import 'dart:developer';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static const String _role = 'userRole';
  static const String _idKey = 'id';
  static const String _emailKey = 'email';

  // Singleton instance for SharedPreferences
  static late SharedPreferences _preferences;


  // Private variables to hold id and userId
  static String? _id;
  static String? _userRole;
  static String? _email;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _userRole = _preferences.getString(_role);
    // Load id and userId from SharedPreferences into private variables
    _id = _preferences.getString(_idKey);
    _email = _preferences.getString(_emailKey);
  }

  // Check if a id exists in local storage
  static bool hasId() {
    return _preferences.containsKey(_idKey);
  }

  // Save the id and user email to local storage
  static Future<void> saveId(String id, String email) async {
    try {
      await _preferences.setString(_idKey, id);
      await _preferences.setString(_emailKey, email);
      // Update private variables
      _id = id;
      _email = email;
    } catch (e) {
      log('Error saving id: $e');
    }
  }
  static Future<void> saveRole(String role) async {
    try {
      await _preferences.setString(_role, role);
      _userRole = role;
    } catch (e) {
      log('Error saving id: $e');
    }
  }


  // Clear authentication data (for logout or clearing auth data)
  static Future<void> logoutUser() async {
    try {
      // Clear all data from SharedPreferences
      await _preferences.clear();

      // Reset private variables
      _id = null;
      _userRole = null;
      _email = null;
      // Redirect to the login screen
      await goToLogin();
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  // Navigate to the login screen (e.g., after logout or id expiry)
  static Future<void> goToLogin() async {
    Get.offAllNamed(AppRoute.signInScreen);
  }

  // Getter for id
  static String? get id => _id;
  static String? get userRole => _userRole;
  static String? get email => _email;
}
