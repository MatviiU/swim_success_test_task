import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/features/pace_selector/domain/constants/pace_constants.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_cubit.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_state.dart';

class PaceSliderWidget extends StatelessWidget {
  const PaceSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaceCubit>();
    return BlocBuilder<PaceCubit, PaceState>(
      buildWhen: (previous, current) =>
          previous.paceSeconds != current.paceSeconds,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: state.paceSeconds.toDouble(),
              min: PaceConstants.minSeconds.toDouble(),
              max: PaceConstants.maxSeconds.toDouble(),
              divisions: PaceConstants.maxSeconds - PaceConstants.minSeconds,
              onChanged: (value) => cubit.setFromSlider(value.round()),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _TickLabels(
                ticks: PaceConstants.sliderTickSeconds,
                min: PaceConstants.minSeconds,
                max: PaceConstants.maxSeconds,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TickLabels extends StatelessWidget {
  const _TickLabels({
    required this.ticks,
    required this.min,
    required this.max,
  });

  final List<int> ticks;
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final range = max - min;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: 20,
          child: Stack(
            children: [
              for (final tick in ticks)
                Positioned(
                  left: ((tick - min) / range) * width - 16,
                  child: SizedBox(
                    width: 32,
                    child: Text(
                      _formatTime(tick),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secondsValue = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secondsValue';
  }
}
