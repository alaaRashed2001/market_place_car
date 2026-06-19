import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure(super.message);
}

class PhoneNotFoundFailure extends Failure {
  const PhoneNotFoundFailure(super.message);
}

class OtpExpiredFailure extends Failure {
  const OtpExpiredFailure(super.message);
}

class OtpInvalidFailure extends Failure {
  const OtpInvalidFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
