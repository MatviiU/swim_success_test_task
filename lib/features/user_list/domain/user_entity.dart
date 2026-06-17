import 'package:equatable/equatable.dart';

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
  
  @override
  List<Object?> get props => [userId, name, email, phone];
}
