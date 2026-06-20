import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swim_success/core/router/app_routes.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Text(user.phone),
      onTap: () =>
          context.push('${AppRoutes.users}/${user.userId}', extra: user),
    );
  }
}
