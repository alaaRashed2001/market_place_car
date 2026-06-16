class ApiEndpoints {
  static const String baseUrl = 'https://api.carads.com/v1';

  // Auth
  static const String login           = '/auth/login';
  static const String signUp          = '/auth/register';
  static const String forgotPassword  = '/auth/forgot-password';
  static const String verifyOtp       = '/auth/verify-otp';
  static const String verifySignUpOtp = '/auth/verify-registration-otp';
  static const String resetPassword   = '/auth/reset-password';
  static const String logout          = '/auth/logout';
}
