import 'package:flutter/material.dart';
import 'package:swim_success/core/constants/app_constants.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/features/user_list/presentation/widgets/user_list_tile.dart';

class UserListViewWidget extends StatelessWidget {
  const UserListViewWidget({super.key, required this.users});

  final List<UserEntity> users;

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return ListView(
        children: [const Center(child: Text(AppStringsConstants.noUsersFound))],
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return UserListTile(user: user);
      },
    );
  }
}
