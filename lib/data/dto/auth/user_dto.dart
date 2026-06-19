import 'package:market_place_car/domain/entities/auth/user_entity.dart';

class UseDto extends UserEntity {
  const UseDto({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phoneNumber,
    super.token,
  });

  factory UseDto.fromJson(Map<String, dynamic> json) => UseDto(
        id: json['id'] as String,
        fullName: json['full_name'] as String,
        email: json['email'] as String,
        phoneNumber: json['phone_number'] as String,
        token: json['token'] as String?,
      );

}
