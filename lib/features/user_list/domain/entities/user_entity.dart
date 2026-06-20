import 'package:equatable/equatable.dart';
import 'package:swim_success/features/user_list/data/models/user_dto.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.website,
    required this.company,
    required this.city,
  });

  final String userId;
  final String name;
  final String email;
  final String phone;
  final String username;
  final String website;
  final String company;
  final String city;

  factory UserEntity.fromDto(UserDto userDto) {
    return UserEntity(
      userId: userDto.userId,
      name: userDto.name,
      email: userDto.email,
      phone: userDto.phone,
      username: userDto.username,
      website: userDto.website,
      company: userDto.company,
      city: userDto.city,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    name,
    email,
    phone,
    username,
    website,
    company,
    city,
  ];
}
