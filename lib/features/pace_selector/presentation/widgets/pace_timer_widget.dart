import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_cubit.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_state.dart';
import 'package:swim_success/features/pace_selector/presentation/widgets/pace_unit_column.dart';

class PaceTimerWidget extends StatelessWidget {
  const PaceTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaceCubit>();
    final theme = Theme.of(context);

    return BlocBuilder<PaceCubit, PaceState>(
      buildWhen: (previous, current) =>
          previous.paceSeconds != current.paceSeconds,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PaceUnitColumn(
              value: state.minutes,
              onIncrement: () => cubit.setMinutes(state.minutes + 1),
              onDecrement: () => cubit.setMinutes(state.minutes - 1),
              onSubmitted: cubit.setMinutes,
              twoDigits: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(':', style: theme.textTheme.displayLarge),
            ),
            PaceUnitColumn(
              value: state.seconds,
              onIncrement: () => cubit.setSeconds(state.seconds + 1),
              onDecrement: () => cubit.setSeconds(state.seconds - 1),
              onSubmitted: cubit.setSeconds,
            ),
          ],
        );
      },
    );
  }
}
