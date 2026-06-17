import 'package:equatable/equatable.dart';
import 'package:swim_success/features/user_list/data/models/user_dto.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
  });

  final String userId;
  final String name;
  final String email;
  final String phone;

  factory UserEntity.fromDto(UserDto userDto) {
    return UserEntity(
      userId: userDto.userId,
      name: userDto.name,
      email: userDto.email,
      phone: userDto.phone,
    );
  }

  @override
  List<Object?> get props => [userId, name, email, phone];
}
