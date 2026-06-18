abstract class AuthFailure {
  final String message;
  const AuthFailure(this.message);
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure() : super('Invalid phone number or password.');
}

class PhoneNotFoundFailure extends AuthFailure {
  const PhoneNotFoundFailure() : super('Phone number not found.');
}

class OtpExpiredFailure extends AuthFailure {
  const OtpExpiredFailure() : super('OTP code has expired.');
}

class OtpInvalidFailure extends AuthFailure {
  const OtpInvalidFailure() : super('OTP code is invalid.');
}

class ServerFailure extends AuthFailure {
  const ServerFailure([super.msg = 'Server error. Please try again.']);
}

class NetworkFailure extends AuthFailure {
  const NetworkFailure() : super('No internet connection.');
}