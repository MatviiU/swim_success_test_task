class UserDto {
  UserDto({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.website,
    required this.company,
    required this.city,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    final address = json['address'] as Map<String, dynamic>?;
    final company = json['company'] as Map<String, dynamic>?;
    return UserDto(
      userId: (json['id'] as int?)?.toString() ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      username: json['username'] as String? ?? '',
      website: json['website'] as String? ?? '',
      company: company?['name'] as String? ?? '',
      city: address?['city'] as String? ?? '',
    );
  }

  final String userId;
  final String name;
  final String email;
  final String phone;
  final String username;
  final String website;
  final String company;
  final String city;
}
