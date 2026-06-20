import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_cubit.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_state.dart';

class SwimmerLevelWidget extends StatelessWidget {
  const SwimmerLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<PaceCubit, PaceState>(
      buildWhen: (previous, current) =>
          previous.swimmerLevel != current.swimmerLevel,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your level', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(
              state.swimmerLevel.label,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        );
      },
    );
  }
}
