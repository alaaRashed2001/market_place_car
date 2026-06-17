// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CarAds';

  @override
  String get onboarding_title_1 => 'Welcome to CarAds App';

  @override
  String get onboarding_description_1 =>
      'CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you\'re a car showroom owner or looking to rent a vehicle, our platform has got you covered!';

  @override
  String get onboarding_title_2 => 'Effortless Ads Management';

  @override
  String get onboarding_description_2 =>
      'Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience and receive inquiries with CarAds.';

  @override
  String get onboarding_title_3 => 'Explore Your Options';

  @override
  String get onboarding_description_3 =>
      'Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms with CarAds.';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get joinNowAsUser => 'Join Now As A User';

  @override
  String get joinNowAsShowroom => 'Join Now As A Showroom';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get logout => 'Log out';

  @override
  String get welcomeBack => 'Welcome Back to CarAds!';

  @override
  String get signInSubtitle =>
      'Sign in to your account and get back on track with CarAds';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get password => 'Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get forgotPassword => 'Forgot Your Password?';

  @override
  String get forgotPasswordSubtitle =>
      'No worries! We\'ll help you reset your password. Just enter your registered Phone Number, and we\'ll send you a code to reset your password.';

  @override
  String get send => 'Send';

  @override
  String get verify => 'Verify';

  @override
  String get confirm => 'Confirm';

  @override
  String get verifyPhoneNumber => 'Verify Your Phone Number';

  @override
  String otpSentTo(String phone) {
    return 'Please Enter The Otp Code Sent To $phone';
  }

  @override
  String resendCodeIn(int seconds) {
    return 'Resend code in $seconds s';
  }

  @override
  String get resendCode => 'Resend code';

  @override
  String get createNewPassword => 'Create New Password';

  @override
  String get createNewPasswordSubtitle =>
      'Your New Password Must Be Different From Previously Used Password';

  @override
  String get joinCarAds => 'Join CarAds Today!';

  @override
  String get signUpSubtitle =>
      'Create your account and become a part of CarAds community';

  @override
  String get orContinueWith => 'or continue with';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get verification => 'verification';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidPhone => 'Enter a valid phone number';

  @override
  String get invalidEmail => 'Enter a valid email address';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';
}
