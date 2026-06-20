import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/core/constants/app_constants.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_cubit.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_state.dart';
import 'package:swim_success/features/pace_selector/presentation/widgets/continue_button.dart';
import 'package:swim_success/features/pace_selector/presentation/widgets/pace_slider_widget.dart';
import 'package:swim_success/features/pace_selector/presentation/widgets/pace_timer_widget.dart';
import 'package:swim_success/features/pace_selector/presentation/widgets/swimmer_level_widget.dart';

class PaceSelectorPage extends StatelessWidget {
  const PaceSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStringsConstants.setYourPace)),
      body: BlocListener<PaceCubit, PaceState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          final messenger = ScaffoldMessenger.of(context);
          if (state.status == SubmissionStatus.error) {
            messenger.showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? AppStringsConstants.somethingWentWrong,
                ),
              ),
            );
          } else if (state.status == SubmissionStatus.success) {
            messenger.showSnackBar(
              const SnackBar(
                content: Text(AppStringsConstants.paceSubmitted),
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Spacer(),
                PaceTimerWidget(),
                SizedBox(height: 24),
                PaceSliderWidget(),
                SizedBox(height: 32),
                SwimmerLevelWidget(),
                Spacer(),
                const SizedBox(width: double.infinity, child: ContinueButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
