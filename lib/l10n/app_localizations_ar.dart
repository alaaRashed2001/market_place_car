// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'كار آدز';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get welcomeBack => 'مرحباً بعودتك إلى كار آدز!';

  @override
  String get signInSubtitle => 'سجّل الدخول إلى حسابك وتابع رحلتك مع كار آدز';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get password => 'كلمة المرور';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get emailAddress => 'البريد الإلكتروني';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get forgotPasswordSubtitle =>
      'لا تقلق! سنساعدك على إعادة تعيين كلمة المرور. أدخل رقم هاتفك المسجّل وسنرسل لك رمزاً لإعادة التعيين.';

  @override
  String get send => 'إرسال';

  @override
  String get verify => 'تحقق';

  @override
  String get confirm => 'تأكيد';

  @override
  String get verifyPhoneNumber => 'تحقق من رقم هاتفك';

  @override
  String otpSentTo(String phone) {
    return 'أدخل رمز التحقق المرسل إلى $phone';
  }

  @override
  String resendCodeIn(int seconds) {
    return 'إعادة إرسال الرمز خلال $seconds ث';
  }

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String get createNewPassword => 'إنشاء كلمة مرور جديدة';

  @override
  String get createNewPasswordSubtitle =>
      'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور المستخدمة سابقاً';

  @override
  String get joinCarAds => 'انضم إلى كار آدز اليوم!';

  @override
  String get signUpSubtitle => 'أنشئ حسابك وكن جزءاً من مجتمع كار آدز';

  @override
  String get orContinueWith => 'أو تابع بـ';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get verification => 'التحقق';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get invalidPhone => 'أدخل رقم هاتف صحيح';

  @override
  String get invalidEmail => 'أدخل بريداً إلكترونياً صحيحاً';

  @override
  String get passwordTooShort => 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';
}
