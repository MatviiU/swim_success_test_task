import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/core/constants/app_constants.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_cubit.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_state.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaceCubit>();

    return BlocBuilder<PaceCubit, PaceState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final isSuccess = state.status == SubmissionStatus.success;
        return ElevatedButton(
          onPressed: state.isSubmitting || isSuccess
              ? null
              : () => cubit.submitPace(state.paceSeconds),
          child: switch (state.status) {
            SubmissionStatus.loading => const SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SubmissionStatus.success => const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check, size: 22),
                SizedBox(width: 8),
                Text('Saved'),
              ],
            ),
            _ => const Text(AppStringsConstants.continueButton),
          },
        );
      },
    );
  }
}
