import 'package:flutter/material.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/features/user_list/presentation/widgets/info_card.dart';
import 'package:swim_success/features/user_list/presentation/widgets/info_tile.dart';
import 'package:swim_success/features/user_list/presentation/widgets/user_details_header.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          UserDetailsHeader(user: user),
          const SizedBox(height: 32),
          InfoCard(
            tiles: [
              InfoTile(
                icon: Icons.email_outlined,
                label: 'Email',
                value: user.email,
              ),
              InfoTile(
                icon: Icons.phone_outlined,
                label: 'Phone',
                value: user.phone,
              ),
              InfoTile(
                icon: Icons.language_outlined,
                label: 'Website',
                value: user.website,
              ),
              InfoTile(
                icon: Icons.business_outlined,
                label: 'Company',
                value: user.company,
              ),
              InfoTile(
                icon: Icons.location_city_outlined,
                label: 'City',
                value: user.city,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
