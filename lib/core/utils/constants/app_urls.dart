class AppUrls {
  AppUrls._();

  //static const String _baseUrl = 'http://10.0.20.13:5025/api/v1';

  /// VPS
  static const String _baseUrl = 'http://139.59.182.33:5025/api/v1';


  static const String signUp = '$_baseUrl/user/create';
  static const String verifyOTP = '$_baseUrl/auth/verfiy-otp';
  static const String resendOTP = '$_baseUrl/auth/resend-otp';
  static const String login = '$_baseUrl/auth/login';
  static const String resetPassword = '$_baseUrl/auth/reset-password';
  static const String getMe = '$_baseUrl/user/get-profile';
  static const String createJobPost = '$_baseUrl/job/create';


}
