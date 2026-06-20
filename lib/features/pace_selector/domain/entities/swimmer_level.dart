import 'package:swim_success/core/constants/app_constants.dart';
import 'package:swim_success/features/pace_selector/domain/constants/pace_constants.dart';

enum SwimmerLevel {
  beginner(AppStringsConstants.swimmerLevelBeginner),
  intermediate(AppStringsConstants.swimmerLevelIntermediate),
  advanced(AppStringsConstants.swimmerLevelAdvanced),
  elite(AppStringsConstants.swimmerLevelElite);

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
