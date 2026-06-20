import 'package:flutter/material.dart';
import 'package:swim_success/features/user_list/domain/entities/user_entity.dart';

class UserDetailsHeader extends StatelessWidget {
  const UserDetailsHeader({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initial = user.name.isNotEmpty ? user.name[0].toUpperCase() : '?';
    return Column(
      children: [
        CircleAvatar(
          radius: 44,
          backgroundColor: theme.colorScheme.primary,
          child: Text(
            initial,
            style: theme.textTheme.displaySmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(user.name, style: theme.textTheme.titleLarge),
        if (user.username.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text('@${user.username}', style: theme.textTheme.bodyMedium),
        ],
      ],
    );
  }
}
