class UserDto {
  UserDto({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      userId: (json['id'] as int?)?.toString() ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );
  }

  final String userId;
  final String name;
  final String email;
  final String phone;
}
