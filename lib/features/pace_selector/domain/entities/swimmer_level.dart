import 'package:swim_success/features/pace_selector/domain/constants/pace_constants.dart';

enum SwimmerLevel {
  beginner('Beginner'),
  intermediate('Intermediate'),
  advanced('Advanced'),
  elite('Elite');

  const SwimmerLevel(this.label);

  factory SwimmerLevel.fromSeconds(int seconds) {
    if (seconds < PaceConstants.eliteThresholdSeconds) {
      return SwimmerLevel.elite;
    }
    if (seconds < PaceConstants.advancedThresholdSeconds) {
      return SwimmerLevel.advanced;
    }
    if (seconds < PaceConstants.intermediateThresholdSeconds) {
      return SwimmerLevel.intermediate;
    }
    return SwimmerLevel.beginner;
  }

  final String label;
}
